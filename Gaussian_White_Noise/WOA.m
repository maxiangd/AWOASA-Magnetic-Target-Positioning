% The Whale Optimization Algorithm
function [Leader_score,Leader_pos,Convergence_curve,Positions_value]=WOA(SearchAgents_no,Max_iter,dim)

% initialize position vector and score for the leader
Leader_pos=zeros(1,dim);
Leader_score=inf; %change this to -inf for maximization problems

NN=30; 
Convergence_curve=zeros(1,NN*Max_iter);
Positions_value=zeros(NN,dim);
%Initialize the positions of search agents
%Positions=initialization(SearchAgents_no,dim,ub,lb);


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
    
% Main loop
for k=1:NN %Run NN=30 independent optimizations
    t=0;% Loop counter
while t<Max_iter
    for i=1:size(Positions,1)
        
        % Return back the search agents that go beyond the boundaries of the search space
%         Flag4ub=Positions(i,:)>ub;
%         Flag4lb=Positions(i,:)<lb;
%         Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
%         
        % Calculate objective function for each search agent
        
        fitness=Fitness(Positions(i,:));
        fitness_M(i)=fitness;
        % Update the leader
        if fitness<Leader_score % Change this to > for maximization problem
            Leader_score=fitness; % Update alpha
            Leader_pos=Positions(i,:);
        end
        
    end

    
    a=2-t*((2)/Max_iter); % a decreases linearly fron 2 to 0 in Eq. (2.3)
    
    % a2 linearly dicreases from -1 to -2 to calculate t in Eq. (3.12)
    a2=-1+t*((-1)/Max_iter);
    
    % Update the Position of search agents 
    for i=1:size(Positions,1)
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]
        
        A=2*a*r1-a;  % Eq. (2.3) in the paper
        C=2*r2;      % Eq. (2.4) in the paper
        
        
        b=1;               %  parameters in Eq. (2.5)
        l=(a2-1)*rand+1;   %  parameters in Eq. (2.5)
        
        p = rand();        % p in Eq. (2.6)
        
        for j=1:size(Positions,2)
            
            if p<0.5   
                if abs(A)>=1
                    rand_leader_index = floor(SearchAgents_no*rand()+1);
                    X_rand = Positions(rand_leader_index, :);
                    D_X_rand=abs(C*X_rand(j)-Positions(i,j)); % Eq. (2.7)
                    Positions(i,j)=X_rand(j)-A*D_X_rand;      % Eq. (2.8)
                    
                elseif abs(A)<1
                    D_Leader=abs(C*Leader_pos(j)-Positions(i,j)); % Eq. (2.1)
                    Positions(i,j)=Leader_pos(j)-A*D_Leader;      % Eq. (2.2)
                end
                
            elseif p>=0.5
              
                distance2Leader=abs(Leader_pos(j)-Positions(i,j));
                % Eq. (2.5)
                Positions(i,j)=distance2Leader*exp(b.*l).*cos(l.*2*pi)+Leader_pos(j);
                
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
    

%%%%%%%%%%%%%%%% Record the current optimal position and fitness %%%%%%%%%%%%%%%%


t=t+1;
Convergence_curve(1,t+(k-1)*Max_iter)=Leader_score;
Positions_value(k,:)=Leader_pos;
end

end  %end of for k=1:N