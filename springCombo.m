clear
clc

run PCStiffness.m;
run coilStiffness.m;
run angleBracketStiffness.m;

k_ABPair = parallelSpringsCalc(k_AB,k_AB);
% Calculate the stiffness of the module with the given formula
% k_module = seriesSpringsCalc(k_pc_SI, parallelSpringsCalc(k_ABPair,k_coil));

abTotal = 10;

% Initialize the equivalent stiffness with the first k_coil
k_rest_array = k_coil;

% Calculate series stiffness for abTotal repetitions
for i = 2:abTotal
    k_rest_array(i) = seriesSpringsCalc(parallelSpringsCalc(k_rest_array(i-1),k_ABPair), k_pc_SI, k_coil);
end

% Display the final equivalent stiffness after series calculation
% fprintf('The total equivalent stiffness with %d repetitions is %.2f N/m\n', abTotal, double(separateUnits(k_total_series)));

% Initialize total force
total_force = 100e3; % Initial total force in N

% Initialize bracket index
bracket_index = abTotal;

total_force_by_brackets = 0;

% While loop to calculate load transferred to each bracket and update total force
while true
    % Calculate the force on the current bracket
   force_on_bracket_pair = total_force * double(separateUnits(k_ABPair)) / parallelSpringsCalc(double(separateUnits(k_rest_array(bracket_index))), double(separateUnits(k_ABPair)));

    % Subtract the force on the current bracket from total force
    total_force = total_force - force_on_bracket_pair;

    % Display the force on the current bracket
    fprintf('The force on bracket pair %d is %.2f N\n', bracket_index, force_on_bracket_pair);
   
    total_force_by_brackets = total_force_by_brackets + force_on_bracket_pair;
    

    % Decrement the bracket index
    bracket_index = bracket_index - 1;
    
    % Break the loop if all brackets are processed
    if bracket_index == 0
        break;
    end
end

    % Display the remaining total force
    fprintf('Total force taken by brackets is %d \n', total_force_by_brackets);
    
    k_rest_array(end)