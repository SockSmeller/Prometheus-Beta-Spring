function k_eq = parallelSpringsCalc(varargin)
    % This function calculates the equivalent stiffness of springs in parallel.
    % Input: Any number of spring stiffness values as arguments (k1, k2, ..., kn)
    % Output: Equivalent stiffness of the springs in parallel (k_eq)
    
    % Initialize the sum of stiffness values
    total_stiffness = 0;
    
    % Loop through each input argument and add the stiffness value
    for i = 1:nargin
        k = varargin{i}; % Get the ith stiffness value
        % Convert to numerical value if symbolic
        k = double(separateUnits(k));
        if k <= 0
            error('Stiffness values must be positive.');
        end
        total_stiffness = total_stiffness + k;
    end
    
    % The equivalent stiffness for parallel springs is the sum of individual stiffnesses
    k_eq = total_stiffness;
end

% Example usage:
% k_eq = springs_in_parallel(100, 200, 300); % Equivalent stiffness for 3 springs in parallel
% fprintf('Equivalent stiffness of the springs in parallel: %.2f N/m\n', k_eq);
