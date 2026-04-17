clear all 
clc

SearchAgents_no=30; % Number of search agents 

Max_iteration=500; % Maximum number of iterations

dim=6;

X=-3:0.5:3;
Y=17*ones(size(X,2),1);
Z=-1*ones(size(X,2),1);
TA=[X' Y Z]; % Magnetic target position moving from -3 to 3

[Best_score,Best_pos,AWOASA_cg_curve,AWOASA_cg_positions]=AWOASA_st(SearchAgents_no,Max_iteration,dim);

% Convergence curve
figure(1);
plot(AWOASA_cg_curve,'Color','r');
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('AWOASA')

display(['The best solution obtained by AWOASA is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective function found by AWOASA is : ', num2str(Best_score)]);

% 3D trajectory comparison
figure(2);
plot3(TA(:,1),TA(:,2),TA(:,3),'o-',AWOASA_cg_positions(:,1),AWOASA_cg_positions(:,2),AWOASA_cg_positions(:,3),'r*-');
xlabel('x');
ylabel('y');
zlabel('z');
grid on

% X-direction position comparison
figure(3);
plot(1:size(TA),TA(:,1),'o-',1:size(TA),AWOASA_cg_positions(:,1),'r*-');
xlabel('Number of samples');
ylabel('X-direction position/m');
legend('x(real value)','x(estimated value)');
grid on