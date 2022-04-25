function x = macro(x)

%
% __Directly calibrated steady state values__
%

x.ss_roc_y = (1 + 4/100)^(1/4); 
x.ss_roc_cpi = (1 + 5/100)^(1/4);
x.ss_roc_re = (1 - 2/100)^(1/4);
x.ss_rr = 3/400;
x.ss_disc_fws_y = 0.05;


%
% __Dynamic parameters__
%

% Aggregate demand
x.c0_y_gap = 0.7; 0.85; % Autoregression
x.c1_y_gap = 0.10; % Future income
x.c2_y_gap = 0.01; 0.03; % Real short-term rate
x.c3_y_gap = 0.03; 0.10; % Lending conditions
x.c4_y_gap = 0.10; 0.05; % Real exchange rate
x.c5_y_gap = 0.60; 0.10; % Foreign demand


% Potential output
x.c0_roc_y_tnd = 0.90; % Autoregression
x.c1_roc_y_tnd = 0.005; % Error correction response to GDP gap


% Forward output
x.c1_fws_y = 0; 0.5; % Response in discount factor to lending conditions


% Asset price bubble
x.c0_bubble = 0.9;

% Phillips curve
x.c0_roc_cpi = 0.5; 0.65; % lag
x.c1_roc_cpi = 0.07; 0.06; % output gap
x.c2_roc_cpi = 0.04; 0.02; % Real exchange rate gap
x.c3_roc_cpi = 0; 0.02; % Real exchange rate gap change


% Inflation expectations
x.c1_roc_cpi_exp = 0.85;


% Monetary policy reaction function
x.c0_r = 0.7; 0.8;
x.c1_r = 2.5; 2; 1.25;
x.c2_r = 0.2;
x.c3_r = 0.1;
x.r_floor = 0; 

% Real short-term cash rate trend, LCY
x.c0_rr_tnd = 0.95;

% Weight on model-consistent exchange rate expectations
x.c1_e_exp = 0.6; 0.75; % Weight on model-consistent expectations

% Interest premium gap
x.c0_prem_gap = 0.6; 0.85; % Autoregression

% Exchange rate markets
x.c1_prem = 0; 0.5; % Response in interest premium to lending conditions

% Real exchange rate trend
x.c0_roc_re_tnd = 0.95; % Autoregression
x.c1_roc_re_tnd = 0.001; % Error correction response to real exchange rate gap

%=================================================

x.c0_y_gap = 0.7; % Autoregression
x.c1_y_gap = 0.10; % Future income
x.c2_y_gap = 0.05; 0.03; % Real short-term rate
x.c3_y_gap = 0.15; 0.10; % Lending conditions
x.c4_y_gap = 0.02; 0.05; 0.05; % Real exchange rate
x.c5_y_gap = 0.30; 0.10; % Foreign demand

x.c0_roc_cpi = 0.6;
x.c1_roc_cpi = 0.10/4;
x.c2_roc_cpi = 0.05/4;

x.c1_r = 2.5/4;
x.c2_r = 0;

x.c1_roc_y_tnd = 0.001;
x.c1_prem = 0.1;

end%

