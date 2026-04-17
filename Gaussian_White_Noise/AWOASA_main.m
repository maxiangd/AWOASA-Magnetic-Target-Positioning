clear all 
clc

SearchAgents_no=30; % Number of search agents
Max_iteration=500; % Maximum numbef of iterations
dim=6;

[Best_score,Best_pos,AWOASA_cg_curve,AWOASA_cg_positions]=AWOASA(SearchAgents_no,Max_iteration,dim)

figure(1); 
semilogy(AWOASA_cg_curve,'Color','k')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('AWOASA')

display(['The best solution obtained by AWOASA is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by AWOASA is : ', num2str(Best_score)]);

figure(2);
% subplot(1,3,1); 
hist(AWOASA_cg_positions(:,1));
xlabel('x');
ylabel('Number of solution');
% subplot(1,3,2); 
figure(3);
hist(AWOASA_cg_positions(:,2));
xlabel('y');
ylabel('Number of solution');
%subplot(1,3,3); 
figure(4);
hist(AWOASA_cg_positions(:,3));
xlabel('z');
ylabel('Number of solution');

figure(5);
% subplot(1,3,1); 
hist(AWOASA_cg_positions(:,4));
xlabel('Mx');
ylabel('Number of solution');
figure(6);
%subplot(1,3,2); 
hist(AWOASA_cg_positions(:,5));
xlabel('My');
ylabel('Number of solution');
% subplot(1,3,3); 
figure(7);
hist(AWOASA_cg_positions(:,6));
xlabel('Mz');
ylabel('Number of solution');



