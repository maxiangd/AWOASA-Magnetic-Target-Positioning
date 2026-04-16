function [Leader_score,Leader_pos,Convergence_curve]=LWOA(SearchAgents_no,Max_iter,lb,ub,dim,fobj)

% Initialize best solution
Leader_pos=zeros(1,dim);
Leader_score=inf; 

% Initialize positions
Positions=initialization(SearchAgents_no,dim,ub,lb);
Convergence_curve=zeros(1,Max_iter);
t=0;

% Main loop
while t<Max_iter
    for i=1:size(Positions,1)
        % Boundary control
        Flag4ub=Positions(i,:)>ub;
        Flag4lb=Positions(i,:)<lb;
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        
        % Calculate fitness
        fitness=fobj(Positions(i,:));
        
        % Update best solution
        if fitness<Leader_score 
            Leader_score=fitness;
            Leader_pos=Positions(i,:);
        end
    end
    
    % Parameters
    a=2-t*(2/Max_iter); 
    a2=-1+t*(-1/Max_iter);
    
    % Levy flight parameters (beta=1.5)
    beta = 3/2;
    sigma = (gamma(1+beta)*sin(pi*beta/2))/(gamma((1+beta)/2)*beta*2^((beta-1)/2));
    sigma = sigma^(1/beta);
    u = randn()*sigma;
    v = randn();
    step = u./abs(v).^(1/beta);
    
    % Position update
    for i=1:size(Positions,1)
        r2=rand();
        A = 2*a*step-a;
        C = 2*r2;     
        b=1;
        l=(a2-1)*rand+1;
        p = rand();       
        
        for j=1:size(Positions,2)
            if p<0.5   
                if abs(A)>=1
                    rand_leader_index = floor(SearchAgents_no*rand()+1);
                    X_rand = Positions(rand_leader_index, :);
                    D_X_rand = abs(C*X_rand(j)-Positions(i,j)); 
                    Positions(i,j) = X_rand(j)-A*D_X_rand;     
                elseif abs(A)<1
                    D_Leader = abs(C*Leader_pos(j)-Positions(i,j)); 
                    Positions(i,j) = Leader_pos(j)-A*D_Leader;      
                end
            elseif p>=0.5
                distance2Leader = abs(Leader_pos(j)-Positions(i,j));
                Positions(i,j) = distance2Leader*exp(b.*l).*cos(l.*2*pi)+Leader_pos(j);
            end
        end
    end
    
    t=t+1;
    Convergence_curve(t)=Leader_score;
end
end