% The Whale Optimization Algorithm
function [Leader_score,Leader_pos,Convergence_curve,Positions_value]=AWOASA(SearchAgents_no,Max_iter,dim)

% Initialize position vector and score for the leader
Leader_pos=zeros(1,dim);
Leader_score=inf; % Change this to -inf for maximization problems

NN=30; 
Convergence_curve=zeros(1,NN*Max_iter);
Positions_value=zeros(NN,dim);

% Initialize the positions of search agents
% Positions=initialization(SearchAgents_no,dim,ub,lb);

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
fitness_M=zeros(1,size(Positions,1));

for i=1:size(Positions,1)
    fitness=Fitness(Positions(i,:));
    fitness_M(i)=fitness;
end

T=max(fitness_M)-min(fitness_M); % Initial temperature for simulated annealing

% Main loop
for k=1:NN % Run NN=30 independent optimizations
    t=0; % Loop counter
    
while t<Max_iter
    for i=1:size(Positions,1)
        
        % Calculate objective function for each search agent
        fitness=Fitness(Positions(i,:));
        fitness_M(i)=fitness;
        
        % Update the leader
        if fitness<Leader_score % Change this to > for maximization problem
            Leader_score=fitness;
            Leader_pos=Positions(i,:);
        end
        
    end

    a=2-t*((2)/Max_iter); % a decreases linearly from 2 to 0
    a2=-1+t*((-1)/Max_iter); % a2 decreases linearly from -1 to -2
    
    % Update the Position of search agents 
    for i=1:size(Positions,1)
        r1=rand();
        r2=rand();
        
        A=2*a*r1-a;
        C=2*r2;
        
        b=1;
        l=(a2-1)*rand+1;
        p=rand();
        
        for j=1:size(Positions,2)
            
            if p<0.5   
                if abs(A)>=1
                    rand_leader_index = floor(SearchAgents_no*rand()+1);
                    X_rand = Positions(rand_leader_index, :);
                    D_X_rand=abs(C*X_rand(j)-Positions(i,j));
                    Positions(i,j)=X_rand(j)-A*D_X_rand;
                    
                elseif abs(A)<1
                    D_Leader=abs(C*Leader_pos(j)-Positions(i,j));
                    Positions(i,j)=Leader_pos(j)-A*D_Leader;
                end
                
            elseif p>=0.5
                distance2Leader=abs(Leader_pos(j)-Positions(i,j));
                Positions(i,j)=distance2Leader*exp(b.*l).*cos(l.*2*pi)+Leader_pos(j);
            end
        end
        
        % Boundary constraints
        Positions(i,1)=limit_value(Positions(i,1),low1,upper1);
        Positions(i,2)=limit_value(Positions(i,2),low1,upper1);
        Positions(i,3)=limit_value(Positions(i,3),low2,upper2);
        Positions(i,4)=limit_value(Positions(i,4),low3,upper3);
        Positions(i,5)=limit_value(Positions(i,5),low3,upper3);
        Positions(i,6)=limit_value(Positions(i,6),low3,upper3);
    end
    
    %%%%%%%%%%%%%%%%% Simulated Annealing (SA) Operation %%%%%%%%%%%%%%%%
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
        fitness_new=Fitness(Positions_new(i,:));
        fitness=Fitness(Positions(i,:));
        pp=exp(-(fitness_new-fitness)/T); % Acceptance probability
        
        if fitness_new<fitness
            Positions(i,:)=Positions_new(i,:);
        elseif rand()<=pp
            Positions(i,:)=Positions_new(i,:);
        else
            Positions(i,:)=Positions(i,:);
        end
    end

    T=T*0.99; % Temperature cooling
    %%%%%%%%%%%%%%%%% End of Simulated Annealing %%%%%%%%%%%%%%%%%%%%%%%%

    % Record current best position and score
    t=t+1;
    Convergence_curve(1,t+(k-1)*Max_iter)=Leader_score;
    Positions_value(k,:)=Leader_pos;
end

end