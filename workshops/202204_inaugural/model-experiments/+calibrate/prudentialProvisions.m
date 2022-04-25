function x = prudentialProvisions(x)

% PD for performing loans
x.pd_lp_hh = 0.06; 
x.pd_lp_nfc = 0.05; 


% Downturn PD for non-performing loans
x.pd_ln_hh = 1;
x.pd_ln_nfc = 1; 


% Downturn LGD for performing loans
x.lgd_lp_hh = 0.85; 
x.lgd_lp_nfc = 0.45;


% Downturn LGD for non-performing loans
x.lgd_ln_hh = 0.95; 
x.lgd_ln_nfc = 0.85;

x.lambda_hh =  x.lgd_ln_hh;
x.lambda_nfc = x.lgd_ln_nfc;

% Fixed effect
x.c0_ap_fe_hh = 0.94;
x.c0_ap_fe_nfc = 0.94;

end%

