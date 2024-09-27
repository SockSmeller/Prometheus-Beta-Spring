%% FG Spring Stiffness Calculation

% Import symbolic units
units = symunit;

% Define the properties of the FG spring with symbolic units
E_FG = 2500000 * units.psi;                 % Young's modulus of FG in GPa
thickness_FG = 0.15 * units.mm;        % Thickness of FG in mm
length_FG = 75 * units.ft;             % Length of FG in feet
L_FG = 1.94 * units.in;                % Length of the FG spring in inches

% Convert all FG spring properties to SI units (meters and Pascals)
E_FG_SI = rewrite(E_FG, units.Pa);                   % Convert Young's modulus to Pascals (Pa)
thickness_FG_SI = rewrite(thickness_FG, units.m);    % Convert thickness to meters (m)
length_FG_SI = rewrite(length_FG, units.m);          % Convert length to meters (m)
L_FG_SI = rewrite(L_FG, units.m);                    % Convert spring length to meters (m)

% Calculate the cross-sectional area of the FG spring
A_FG_SI = thickness_FG_SI * length_FG_SI;            % Cross-sectional area in m^2

% Calculate FG Spring Stiffness in SI units
k_FG_SI = (E_FG_SI * A_FG_SI) / L_FG_SI;             % Stiffness in N/m

% Display the calculated stiffness of the FG spring in N/m
fprintf('The calculated stiffness of the FG spring is %.2f MN/m\n', double(separateUnits(k_FG_SI))/1e6);

%% Epoxy Spring Stiffness Calculation

% Import symbolic units
units = symunit;

% Define the properties of the epoxy spring with symbolic units
E_epoxy = 360000 * units.psi;           % Tensile modulus of epoxy in psi
D1_epoxy = 4.316 * units.in;            % Inner diameter of epoxy spring in inches
D2_epoxy = 6 * units.in;                % Outer diameter of epoxy spring in inches
A_epoxy = pi/4 * (D2_epoxy^2 - D1_epoxy^2); % Cross-sectional area of epoxy spring in in^2
L_epoxy = 1.94 * units.in;              % Length of the epoxy spring in inches

% Convert all epoxy spring properties to SI units (meters and Pascals)
E_epoxy_SI = rewrite(E_epoxy, units.Pa);     % Convert Young's modulus to Pascals (Pa)
D1_epoxy_SI = rewrite(D1_epoxy, units.m);    % Convert inner diameter to meters (m)
D2_epoxy_SI = rewrite(D2_epoxy, units.m);    % Convert outer diameter to meters (m)
A_epoxy_SI = pi/4 * (D2_epoxy_SI^2 - D1_epoxy_SI^2); % Recalculate cross-sectional area in m^2
L_epoxy_SI = rewrite(L_epoxy, units.m);      % Convert length to meters

% Calculate Epoxy Spring Stiffness in SI units
k_epoxy_SI = (E_epoxy_SI * (A_epoxy_SI - A_FG_SI)) / L_epoxy_SI; % Stiffness in N/m

% Display the calculated stiffness of the epoxy spring in N/m
fprintf('The calculated stiffness of the epoxy spring is %.2f MN/m\n', double(separateUnits(k_epoxy_SI))/1e6);

%% Copper Coil Spring Stiffness Calculation

% Import symbolic units
units = symunit;

% Define the properties of the copper coil spring with symbolic units
E_copper = 130 * 1e9 * units.Pa;           % Tensile modulus of copper in Pascals (Pa)
D2_copper = 4.316 * units.in;              % Inner diameter of copper coil spring in inches (in)
thickness_copper = 0.138 * units.in;       % Thickness of the copper coil spring in inches (in)
D1_copper = D2_copper - 2 * thickness_copper; % Outer diameter of copper coil spring in inches (in)
A_copper = pi/4 * (D2_copper^2 - D1_copper^2); % Cross-sectional area of copper coil spring

L_copper = 1.94 * units.in;               % Length of the copper coil spring in inches (in)

% Convert all copper coil spring properties to SI units (meters and Pascals)
E_copper_SI = rewrite(E_copper, units.Pa);     % Convert Young's modulus to Pascals (Pa)
D1_copper_SI = rewrite(D1_copper, units.m);    % Convert inner diameter to meters (m)
D2_copper_SI = rewrite(D2_copper, units.m);    % Convert outer diameter to meters (m)
A_copper_SI = rewrite(A_copper, units.m^2);    % Convert cross-sectional area to m^2
L_copper_SI = rewrite(L_copper, units.m);      % Convert length to meters (m)

% Calculate Copper Coil Spring Stiffness in SI units
k_copper_SI = (E_copper_SI * A_copper_SI) / L_copper_SI; % Stiffness in N/m

% Display the calculated stiffness of the copper coil spring in N/m
fprintf('The calculated stiffness of the copper coil spring is %.2f MN/m\n', double(separateUnits(k_copper_SI))/1e6);

%% PLA Coil End Cap Spring Compressive Stiffness Calculation

% Import symbolic units
units = symunit;

% Define the properties of the PLA spring with symbolic units
E_pla = 3500 * units.MPa;           % Tensile modulus of PLA in MPa
D1_pla = 4.03 * units.in;          % Inner diameter of PLA spring in inches
D2_pla = 6 * units.in;              % Outer diameter of PLA spring in inches
A_pla = pi/4 * (D2_pla^2 - D1_pla^2); % Cross-sectional area of PLA spring in in^2
L_pla = 1.94 * units.in;            % Length of the PLA spring in inches

% Convert all PLA spring properties to SI units (meters and Pascals)
E_pla_SI = rewrite(E_pla, units.Pa);     % Convert Young's modulus to Pascals (Pa)
D1_pla_SI = rewrite(D1_pla, units.m);    % Convert inner diameter to meters (m)
D2_pla_SI = rewrite(D2_pla, units.m);    % Convert outer diameter to meters (m)
A_pla_SI = pi/4 * (D2_pla_SI^2 - D1_pla_SI^2); % Recalculate cross-sectional area in m^2
L_pla_SI = rewrite(L_pla, units.m);      % Convert length to meters

% Calculate PLA Spring Stiffness in SI units
k_pla_SI = (E_pla_SI * A_pla_SI) / L_pla_SI; % Stiffness in N/m

% Display the calculated stiffness of the PLA spring in N/m
fprintf('The calculated stiffness of the PLA spring is %.2f MN/m\n', double(separateUnits(k_pla_SI))/1e6);

%% PLA Coil End Cap Spring Bending Stiffness Calculation

%TBD

%% Total Stiffness Calculation

% Calculate the total stiffness of the system in series and parallel
k_coil = seriesSpringsCalc(k_pla_SI, parallelSpringsCalc(k_epoxy_SI, k_copper_SI, k_FG_SI), k_pla_SI);

% Display the total stiffness of the coil spring system
fprintf('The total equivalent stiffness of the coil spring system is %.2f MN/m\n', double(separateUnits(k_coil))/1e6);


