function [Leader_score,Leader_pos,Convergence_curve]=CWOA(SearchAgents_no,Max_iter,lb,ub,dim,fobj)

% Initialize best solution
Leader_pos=zeros(1,dim);
Leader_score=inf; 

% Initialize positions
Positions=initialization(SearchAgents_no,dim,ub,lb);
Convergence_curve=zeros(1,Max_iter);
t=0;

% Standard CWOA parameters
a_initial=2;  
a_final=0;     
mu = 4;
y = zeros(1, Max_iter+1); 
y(1) = rand();

% Main loop
while t<Max_iter
    t=t+1; 
    for i=1:size(Positions,1)
        % Boundary control
        Flag4ub=Positions(i,:)>ub;
        Flag4lb=Positions(i,:)<lb;
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        
        % Evaluate fitness
        fitness=fobj(Positions(i,:));
        
        % Update best solution
        if fitness<Leader_score 
            Leader_score=fitness;
            Leader_pos=Positions(i,:);
        end
    end
    
    % Logistic chaotic map
    if t < Max_iter
        y(t+1) = mu * y(t) * (1 - y(t)); 
    end
    
    % Adaptive parameter a
    a_linear = a_initial - (t-1) * ((a_initial - a_final)/Max_iter);
    a = a_linear .* y(t); 
    a2 = -1 + (t-1)*(-1/Max_iter);
    
    % Position update
    for i=1:size(Positions,1)
        r1=rand(); 
        r2=rand(); 
        A=2*a*r1-a; 
        C=2*r2;     
        b=1;               
        l=(a2-1)*rand+1;   
        p = rand();       
        
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
    end
    Convergence_curve(t)=Leader_score;
end
end