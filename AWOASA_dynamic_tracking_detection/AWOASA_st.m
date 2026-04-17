% The Whale Optimization Algorithm
function [Leader_score,Leader_pos,Convergence_curve,Positions_value]=AWOASA_st(SearchAgents_no,Max_iter,dim)

% initialize position vector and score for the leader
Leader_pos=zeros(1,dim);
Leader_score=inf; %change this to -inf for maximization problems

NN=30;

%%% Initialize position boundaries
low1=-30;
upper1=30;
low2=-3;
upper2=3;
low3=-1500;
upper3=1500;
n=SearchAgents_no;

P1=low1*ones(n,2)+(upper1-low1)*rand(n,2);
P2=low2*ones(n,1)+(upper2-low2)*rand(n,1);
P3=low3*ones(n,3)+(upper3-low3)*rand(n,3);

Positions=[P1 P2 P3];

%%%% Dynamic target position setup
X=-3:0.5:3;
Y=17*ones(size(X,2),1);
Z=-1*ones(size(X,2),1);
TA=[X' Y Z]; % Magnetic target positions moving from -3 to 3
m=size(TA,1); % Number of dynamic target points
%%%%%
Convergence_curve=zeros(1,Max_iter);
Positions_value=zeros(m,dim);
fitness_M=zeros(m,size(Positions,1));
%%%%%%

for m=1:size(TA,1)
    for i=1:size(Positions,1)    
        fitness=Fitness_st(TA(m,:),Positions(i,:));
        fitness_M(m,i)=fitness;
    end
    T(m)=max(fitness_M(m,:))-min(fitness_M(m,:)); % Initial temperature for SA      
end
    
% Main loop
for m=1:size(TA,1)
    t=1;% Loop counter
while t<Max_iter
    for i=1:size(Positions,1)
        
        % Calculate objective function for each search agent
        fitness=Fitness_st(TA(m,:),Positions(i,:));
        fitness_M(m,i)=fitness;
        % Update the leader
        if fitness<Leader_score % Change this to > for maximization problem
            Leader_score=fitness; % Update alpha
            Leader_pos=Positions(i,:);
        end
        
    end

    % Weighted WOA (MS-WOA)
    w=t^3/Max_iter^3; % Weight coefficient
    a=(2-2*t/Max_iter);
    % a2 linearly decreases from -1 to -2
    a2=-1+t*((-1)/Max_iter);
    
    % Update the Position of search agents 
    for i=1:size(Positions,1)
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]
        
        A=2*a*r1-a;  % Eq. (2.3) in the paper
        C=2*r2;      % Eq. (2.4) in the paper
        
        b=1;               % parameters in Eq. (2.5)
        l=(a2-1)*rand+1;   % parameters in Eq. (2.5)
        p = rand();        % p in Eq. (2.6)
        
        for j=1:size(Positions,2)
            
            if p<0.5   
                if abs(A)>=1
                    rand_leader_index = floor(SearchAgents_no*rand()+1);
                    X_rand = Positions(rand_leader_index, :);
                    D_X_rand=abs(C*X_rand(j)-Positions(i,j)); % Eq. (2.7)
                    Positions(i,j)=w*X_rand(j)-A*D_X_rand;      % Eq. (2.8)
                    
                elseif abs(A)<1
                    D_Leader=abs(C*Leader_pos(j)-Positions(i,j)); % Eq. (2.1)
                    Positions(i,j)=w*Leader_pos(j)-A*D_Leader;      % Eq. (2.2)
                end
                
            elseif p>=0.5
              
                distance2Leader=abs(Leader_pos(j)-Positions(i,j));
                % Eq. (2.5)
                Positions(i,j)=distance2Leader*exp(b.*l).*cos(l.*2*pi)+w*Leader_pos(j);
                
            end
                           
        end
        
        % Boundary limitation
        Positions(i,1)=limit_value(Positions(i,1),low1,upper1);
        Positions(i,2)=limit_value(Positions(i,2),low1,upper1);
        Positions(i,3)=limit_value(Positions(i,3),low2,upper2);
        Positions(i,4)=limit_value(Positions(i,4),low3,upper3);
        Positions(i,5)=limit_value(Positions(i,5),low3,upper3);
        Positions(i,6)=limit_value(Positions(i,6),low3,upper3);
                
    end
    
    %%%%%%%%%%%%%%% Simulated Annealing Operation %%%%%%%%%%%%%
    low1=-30;
    upper1=30;
    low2=-3;
    upper2=3;
    low3=-1500;
    upper3=1500;
    n=SearchAgents_no;

    P1=low1*ones(n,2)+(upper1-low1)*rand(n,2);
    P2=low2*ones(n,1)+(upper2-low2)*rand(n,1);
    P3=low3*ones(n,3)+(upper3-low3)*rand(n,3);
 
    Positions_new=[P1 P2 P3];

    for i=1:size(Positions,1)
      
        % Calculate objective function for each search agent
        fitness_new=Fitness_st(TA(m,:),Positions_new(i,:));
        fitness=Fitness_st(TA(m,:),Positions(i,:));
        pp=exp(-(fitness_new-fitness)/T(m)); % Acceptance probability
        
        % Update position
        if fitness_new<fitness
            Positions(i,:)=Positions_new(i,:);
        elseif rand()<=pp
            Positions(i,:)=Positions_new(i,:);
        else
            Positions(i,:)=Positions(i,:);
        end
    end
     

    T(m)=T(m)*0.99; % Cooling schedule for SA
    %%%%%%%%%%%%%%%%% End of SA %%%%%%%%%%%%%%%%%%%%

    %%%%%%%%%%%%%%%%% Record current optimal position and fitness %%%%%%%%

    Convergence_curve(1,t)=Leader_score;
    t=t+1;
end  %end for while t

Positions_value(m,:)=Leader_pos;
[m,TA(m,:),Leader_pos]

end  %end for m=1:size(TA,1)