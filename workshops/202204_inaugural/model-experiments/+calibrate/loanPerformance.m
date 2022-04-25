% Calibrate loan portfolio and performance

function x = loanPerformance(x)

% Write-off process
x.omega_hh = 0.15;
x.omega_nfc = 0.10;

% % Inflow to write-off buffer
% x.lambda_hh = 0.9; 0.60;
% x.lambda_nfc = 0.87; 0.60;

% Paydown factor
x.theta_lp_hh = 0.22; 0.20; % Yuliya is happy
x.theta_lp_nfc = 0.15; 0.52; 0.20; % Yuliya is happy!!!

% Recovery factor
x.theta_ln_hh = 0.01; 0.20;
x.theta_ln_nfc = 0.01; 0.20;

% % Exposure to foreign currency
% x.sigma_hh = 0.14; 0.3;
% x.sigma_nfc = 0.46; 0.6;

% Exchange rate exposure switch
x.c0_sigma_hh = 0.97;
x.c0_sigma_nfc = 1-0.25/100;

% Exchange rate exposure switch for new loans
x.new_sigma_hh = 0;
x.new_sigma_nfc = 0.40;

% S/s Exchange rate exposure switch
x.ss_sigma_hh = 0;
x.ss_sigma_nfc = 0.40;


end%

