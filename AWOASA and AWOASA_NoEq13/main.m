clc
clear 
close all

% Run parameters
Run_times = 50;

% Storage for AWOASA
all_best_scores_awoasa = zeros(1, Run_times);
all_cg_curves_awoasa = [];

% Storage for AWOASA-NoEq13
all_best_scores_awoasa13 = zeros(1, Run_times);
all_cg_curves_awoasa13 = [];

% Algorithm settings
SearchAgents_no = 30;
Function_name = 'F8';
Max_iteration = 500;
[lb,ub,dim,fobj] = Get_Functions_details(Function_name);

% Run AWOASA 50 times
for run_idx = 1:Run_times
    [Best_score,Best_pos,AWOASA_cg_curve] = AWOASA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
    all_best_scores_awoasa(run_idx) = Best_score;
    all_cg_curves_awoasa(:,run_idx) = AWOASA_cg_curve;
end

% Run AWOASA-NoEq13 50 times
for run_idx = 1:Run_times
    [Best_score_13,Best_pos_13,AWOASA13_cg_curve] = AWOASA_NoEq13(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
    all_best_scores_awoasa13(run_idx) = Best_score_13;
    all_cg_curves_awoasa13(:,run_idx) = AWOASA13_cg_curve;
end

% Calculate statistics
score_mean_awoasa = mean(all_best_scores_awoasa);
score_variance_awoasa = std(all_best_scores_awoasa);
mean_cg_curve_awoasa = mean(all_cg_curves_awoasa, 2);

score_mean_awoasa13 = mean(all_best_scores_awoasa13);
score_variance_awoasa13 = std(all_best_scores_awoasa13);
mean_cg_curve_awoasa13 = mean(all_cg_curves_awoasa13, 2);

% Display results
disp(['Benchmark function: ', Function_name]);
disp(['AWOASA mean(std): ', num2str(score_mean_awoasa), ' (', num2str(score_variance_awoasa), ')']);
disp(['AWOASA-NoEq13 mean(std): ', num2str(score_mean_awoasa13), ' (', num2str(score_variance_awoasa13), ')']);

% Plot convergence curve
figure('Position',[269 240 660 400])

plot(mean_cg_curve_awoasa,'r','LineWidth',1.2,'DisplayName','AWOASA');
hold on;
plot(mean_cg_curve_awoasa13,'b--','LineWidth',1.2,'DisplayName','AWOASA-NoEq13');
hold off;

title(['50-Run Average Convergence Curve - ', Function_name], ...
    'FontName','Times New Roman','FontSize',14);
xlabel('Iteration','FontName','Times New Roman','FontSize',14);
ylabel('Best Fitness Value','FontName','Times New Roman','FontSize',14);

axis tight
grid on
box on
lgd = legend('Location','best');
set(lgd,'FontName','Times New Roman','FontSize',14);
set(gca,'FontName','Times New Roman','FontSize',14);