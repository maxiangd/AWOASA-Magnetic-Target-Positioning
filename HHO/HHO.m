function [Rabbit_fitness,Rabbit_pos,Convergence_curve]=HHO(SearchAgents_no,Max_iter,lb,ub,dim,fobj)

% Harris Hawks Optimization (2019)
% Author: Original paper implementation

% Initialize rabbit (best solution)
Rabbit_pos = zeros(1, dim);
Rabbit_fitness = inf;

% Initialize hawks population
Positions = initialization(SearchAgents_no, dim, ub, lb);
Convergence_curve = zeros(1, Max_iter);
t = 0;

% Main loop
while t < Max_iter
    % Update best solution
    for i = 1:size(Positions, 1)
        Positions(i, :) = max(min(Positions(i, :), ub), lb);
        fitness = fobj(Positions(i, :));
        
        if fitness < Rabbit_fitness
            Rabbit_fitness = fitness;
            Rabbit_pos = Positions(i, :);
        end
    end
    
    % Update hawks positions
    for i = 1:size(Positions, 1)
        E0 = 2 * rand() - 1;
        E = 2 * E0 * (1 - t / Max_iter);
        J = 2 * (1 - rand());
        r3 = rand();
        r4 = rand();
        
        for j = 1:dim
            % Exploration phase
            if abs(E) >= 1
                rand_index = floor(SearchAgents_no * rand() + 1);
                X_rand = Positions(rand_index, :);
                Positions(i, j) = X_rand(j) - r3 * abs(X_rand(j) - 2 * r4 * Positions(i, j));
            
            % Exploitation phase
            else
                % Soft besiege
                if abs(E) >= 0.5
                    Positions(i, j) = (Rabbit_pos(j) - Positions(i, j)) - E * abs(J * Rabbit_pos(j) - Positions(i, j));
                
                % Hard besiege
                else
                    if r3 >= 0.5
                        Positions(i, j) = Rabbit_pos(j) - E * abs(Rabbit_pos(j) - Positions(i, j));
                    else
                        if length(lb) >= j
                            temp = lb(j) + (ub(j) - lb(j)) * rand();
                        else
                            temp = lb + (ub - lb) * rand();
                        end
                        Positions(i, j) = Rabbit_pos(j) - E * abs(J * Rabbit_pos(j) - temp);
                    end
                end
            end
        end
        
        Positions(i, :) = max(min(Positions(i, :), ub), lb);
    end
    
    t = t + 1;
    Convergence_curve(t) = Rabbit_fitness;
end
end