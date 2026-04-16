clc
clear 
close all

% Run 50 times for statistical results
Run_times = 50;
all_best_scores = zeros(1, Run_times);
all_cg_curves = []; 

% Parameter settings
SearchAgents_no = 30;
Function_name = 'F6';
Max_iteration = 500;
[lb,ub,dim,fobj] = Get_Functions_details(Function_name);

% Run 50 iterations
for run_idx = 1:Run_times
    [Best_score,Best_pos,WOA_cg_curve] = WOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
    all_best_scores(run_idx) = Best_score;
    all_cg_curves(:,run_idx) = WOA_cg_curve;
end

% Calculate mean and std
score_variance = std(all_best_scores, 1);
score_mean = mean(all_best_scores);
mean_cg_curve = mean(all_cg_curves, 2);

% Display results
display(Function_name);
display(['Best scores of 50 runs: ', num2str(all_best_scores)]);
display(['Mean of best scores: ', num2str(score_mean)]);
display(['Std of best scores: ', num2str(score_variance)]);
display(['Best position of last run: ', num2str(Best_pos)]);
display(['Best score of last run: ', num2str(Best_score)]);

% Plot figures
figure('Position',[269 240 660 290])

subplot(1,2,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

subplot(1,2,2);
semilogy(mean_cg_curve,'r','LineWidth',1.2)
title('Convergence curve (Average of 50 runs)')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('WOA')