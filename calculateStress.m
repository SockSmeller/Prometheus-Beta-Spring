function stress = calculateStress(length, width, force)
    % Function to calculate stress
    % Inputs:
    % length - length of the material (not used in stress calculation)
    % width - width of the material
    % force - applied force
    % Output:
    % stress - calculated stress
    
    % Calculate the cross-sectional area (assuming a rectangular cross-section)
    crossSectionalArea = length * width;
    
    % Calculate the stress (force / area)
    stress_Mpa = (force / crossSectionalArea)/(1e6)
end

