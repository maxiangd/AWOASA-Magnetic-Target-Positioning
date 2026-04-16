function [Best_score, Best_pos, Convergence_curve] = PSO(SearchAgents_no, Max_iteration, lb, ub, dim, fobj)
    % Parameters
    c1 = 1;
    c2 = 1;
    w_max = 0.9;
    w_min = 0.4;
    maxgen = Max_iteration;
    sizepop = SearchAgents_no;

    % Velocity boundaries
    if isscalar(lb), lb = repmat(lb, 1, dim); end
    if isscalar(ub), ub = repmat(ub, 1, dim); end
    Vmax = (ub - lb);
    Vmin = -Vmax;

    % Initialize population and velocity
    for i = 1:sizepop
        pop(i,:) = rand(1,dim).*(ub - lb) + lb;
        V(i,:) = Vmin + rand(1,dim).*(Vmax - Vmin);
        fitness(i) = fobj(pop(i,:));
    end

    % Initialize personal and global best
    [bestfitness,bestindex] = min(fitness);
    Best_pos = pop(bestindex,:);
    gbest = pop;
    fitnessgbest = fitness;
    Best_score = bestfitness;

    Convergence_curve = zeros(1, maxgen);

    % Main iteration loop
    for i = 1:maxgen
        w = w_max - (w_max - w_min) * (i / maxgen);
        
        for j = 1:sizepop
            % Update velocity
            V(j,:) = w*V(j,:) + c1*rand*(gbest(j,:) - pop(j,:)) + c2*rand*(Best_pos - pop(j,:));
            
            % Boundary control for velocity
            idx_upper = V(j,:) > Vmax;
            idx_lower = V(j,:) < Vmin;
            if any(idx_upper)
                V(j,idx_upper) = Vmax(idx_upper);
            end
            if any(idx_lower)
                V(j,idx_lower) = Vmin(idx_lower);
            end
            
            % Update position
            pop(j,:) = pop(j,:) + V(j,:);
            
            % Boundary control for position
            idx_pop_upper = pop(j,:) > ub;
            idx_pop_lower = pop(j,:) < lb;
            if any(idx_pop_upper)
                pop(j,idx_pop_upper) = ub(idx_pop_upper);
            end
            if any(idx_pop_lower)
                pop(j,idx_pop_lower) = lb(idx_pop_lower);
            end
            
            fitness(j) = fobj(pop(j,:));
        end
        
        % Update personal and global best
        for j = 1:sizepop
            if fitness(j) < fitnessgbest(j)
                gbest(j,:) = pop(j,:);
                fitnessgbest(j) = fitness(j);
            end
            if fitness(j) < Best_score
                Best_pos = pop(j,:);
                Best_score = fitness(j);
            end
        end
        
        Convergence_curve(i) = Best_score;
    end
end