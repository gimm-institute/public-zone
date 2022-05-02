function x = creditCreation(x)

% Directly calibrated steady state values


% Transactions parameters
x.c1_trn_hh = 0.12;
x.c1_trn_nfc = 0.03; 


% Inverse velocity of credit parameters
x.c1_ivy_hh = 0.05;
x.c1_ivy_nfc = 0.02; 

x.c2_ivy_hh = 0;
x.c2_ivy_nfc = 0;

x.c0_ivy_tnd_hh = 0.9;
x.c0_ivy_tnd_nfc = 0.9;


% Gross loans to GDP ratio
x.ss_l_to_4ny_hh = 0.12;
x.ss_l_to_4ny_nfc = 0.20;


% Autoregression in loans to GDP trend ratio
x.c0_l_to_4ny_tnd_hh = 0.98; 1.05; % Must be 1+x where x>0
x.c1_l_to_4ny_tnd_hh = 0; 0.10; % Must be greater than x

x.c0_l_to_4ny_tnd_nfc = 0.98; 1.05;
x.c1_l_to_4ny_tnd_nfc = 0; 0.10;


%=================================================

x.ss_l_to_4ny_hh = 0.65;

x.c0_l_to_4ny_tnd_hh = 0.5;
x.c1_l_to_4ny_tnd_hh = 0;

x.c0_ivy_tnd_hh = 0.7;


end%

