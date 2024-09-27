function k_eq = seriesSpringsCalc(varargin)
    % This function calculates the equivalent stiffness of springs in series.
    % Input: Any number of spring stiffness values as arguments (k1, k2, ..., kn)
    % Output: Equivalent stiffness of the springs in series (k_eq)
    
    % Initialize the sum of reciprocals of stiffness values
    reciprocal_sum = 0;
    
    % Loop through each input argument and add the reciprocal of the stiffness
    for i = 1:nargin
        k = varargin{i}; % Get the ith stiffness value
        % Convert to numerical value if symbolic
        k = double(separateUnits(k));
        if k <= 0
            error('Stiffness values must be positive.');
        end
        reciprocal_sum = reciprocal_sum + (1 / k);
    end
    
    % Calculate the equivalent stiffness
    k_eq = 1 / reciprocal_sum;
end

% Example usage:
% k_eq = springs_in_series(100, 200, 300); % Equivalent stiffness for 3 springs
% fprintf('Equivalent stiffness of the springs in series: %.2f N/m\n', k_eq);
