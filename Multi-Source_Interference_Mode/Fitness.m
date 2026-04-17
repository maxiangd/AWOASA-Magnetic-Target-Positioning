function result= Fitness(InputMatrix)
    % ===== Core Parameters =====
    pi=3.14;  
    I=63/180*pi;  % Geomagnetic inclination in Harbin (rad)
    D=-10/180*pi; % Geomagnetic declination in Harbin (rad)
    d=1;          % Baseline length of sensor array (m)
    fs = 1;       % Sampling frequency (Hz)
    t_total = 1;  % Sampling duration (s)
    t = linspace(0, t_total-1/fs, t_total*fs); % Time vector
    
    % ===== Sensor Array Coordinates =====
    T=[[0 0 0],    % Positions of 7 magnetometers
        [-d 0 0],
        [d 0 0],
        [0 -d 0],
        [0 d 0],
        [0 d d],
        [0,-d,d]];
    TA=[-3 17 -1]; % True position of magnetic target (m)
    MA=[435 115 780]; % True magnetic moment components (A·m²)
    Tx=InputMatrix(1,1:3);  % Estimated target position
    Mx=InputMatrix(1,4:6);  % Estimated target magnetic moment
    
    % ===== Physical Constants =====
    u0=4*pi*10^(-7);        % Permeability of free space
    U=[cos(I)*cos(D) cos(I)*sin(D) sin(I)]; % Unit vector of geomagnetic field
    result=0;
    N=7;  % Number of sensors
    
    % ===== Calculate Fitness Using Sensor Pairs =====
    for i=1:6  
        for j=i+1:7
            % Vectors from true target to sensors
            Ri=TA-T(i,:);
            Rj=TA-T(j,:);
            % Vectors from estimated target to sensors
            Rxi=Tx-T(i,:); 
            Rxj=Tx-T(j,:);
            
            % Magnetic anomaly coefficients
            alpha_i=u0/(4*pi*norm(Ri,2)^3);
            alpha_j=u0/(4*pi*norm(Rj,2)^3);
            alpha_x_i=u0/(4*pi*norm(Rxi,2)^3);
            alpha_x_j=u0/(4*pi*norm(Rxj,2)^3);
            
            beta_i=3*(Ri*TA')/norm(Ri,2);
            beta_j=3*(Rj*TA')/norm(Rj,2); 
            beta_x_i=3*(Rxi*Tx')/norm(Rxi,2);
            beta_x_j=3*(Rxj*Tx')/norm(Rxj,2);
            
            % Pure magnetic anomaly values without interference
            B_i=U*alpha_i*(beta_i*Ri'-MA');
            B_j=U*alpha_j*(beta_j*Rj'-MA');
            B_x_i=U*alpha_x_i*(beta_x_i*Rxi'-Mx');
            B_x_j=U*alpha_x_j*(beta_x_j*Rxj'-Mx');
            
            % ===== Multi Source Interference (MSI) model =====
            % 1. 50Hz power line interference (from power lines)
            freq_power = 50;
            interference_50hz = 0.1 * sin(2*pi*freq_power*t);
            
            % 2. Random pulse interference
            interference_pulse = 0.05 * (rand(size(t))*2 - 1);
            
            % 3. Total multi-source interference
            interference_total = interference_50hz + interference_pulse;
            
            % Add composite interference to sensor measurements
            B_i_noise = B_i + interference_total(1);
            B_j_noise = B_j + interference_total(1);
            B_x_i_noise = B_x_i + interference_total(1);
            B_x_j_noise = B_x_j + interference_total(1);
            
            % Calculate fitness (sum of squared errors)
            B_deta_p(i,j)=B_i_noise-B_j_noise;  % Theoretical magnetic anomaly with interference
            B_deta_x_p(i,j)=B_x_i_noise-B_x_j_noise;% Estimated magnetic anomaly with interference
            result=result+(B_deta_x_p(i,j)-B_deta_p(i,j))^2;
        end
    end
end