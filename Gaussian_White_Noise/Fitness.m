function result= Fitness(InputMatrix)

pi=3.14;
I=63/180*pi;  % Geomagnetic environment in Harbin
D=-10/180*pi;
d=1;    % Baseline length

% Positions of 7 magnetometers
T=[[0 0 0],    
    [-d 0 0],
    [d 0 0],
    [0 -d 0],
    [0 d 0],
    [0 d d],
    [0,-d,d]];

TA=[-3 17 -1]; % True position of magnetic target
MA=[435 115 780]; % True magnetic moment components of target

Tx=InputMatrix(1,1:3);
Mx=InputMatrix(1,4:6);

u0=4*pi*10^(-7);
U=[cos(I)*cos(D) cos(I)*sin(D) sin(I)];
result=0;
N=7;

for i=1:6  
    for j=i+1:7
       Ri=TA-T(i,:);
       Rj=TA-T(j,:);
       Rxi=Tx-T(i,:); 
       Rxj=Tx-T(j,:);
       
       alpha_i=u0/(4*pi*norm(Ri,2)^3);
       alpha_j=u0/(4*pi*norm(Rj,2)^3);
       alpha_x_i=u0/(4*pi*norm(Rxi,2)^3);
       alpha_x_j=u0/(4*pi*norm(Rxj,2)^3);
       
       beta_i=3*(Ri*TA')/norm(Ri,2);
       beta_j=3*(Rj*TA')/norm(Rj,2); 
       beta_x_i=3*(Rxi*Tx')/norm(Rxi,2);
       beta_x_j=3*(Rxj*Tx')/norm(Rxj,2);
       
       B_i=U*alpha_i*(beta_i*Ri'-MA');
       B_i_noise=B_i+0.016*randn(size(B_i)); % Add Gaussian white noise to i-th sensor
       B_j=U*alpha_j*(beta_j*Rj'-MA');
       B_j_noise=B_j+0.016*randn(size(B_j)); % Add Gaussian white noise to j-th sensor
       
       B_x_i=U*alpha_x_i*(beta_x_i*Rxi'-Mx');
       B_x_i_noise=B_x_i+0.016*randn(size(B_x_i));
       B_x_j=U*alpha_x_j*(beta_x_j*Rxj'-Mx');
       B_x_j_noise=B_x_j+0.016*randn(size(B_x_j));
       
       B_deta_p(i,j)=B_i_noise-B_j_noise;  % Theoretical magnetic anomaly with Gaussian noise
       
       B_deta_x_p(i,j)=B_x_i_noise-B_x_j_noise; % Estimated magnetic anomaly
       
       result=result+(B_deta_x_p(i,j)-B_deta_p(i,j))^2;  % Fitness function
    end
end

end