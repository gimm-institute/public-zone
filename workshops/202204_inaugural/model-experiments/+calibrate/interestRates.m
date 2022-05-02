function x = interestRates(x)

x.c1_rona = 0;
x.ss_cap_hh = 2;
x.c1_new_rl_full_hh = 0;
x.c1_new_rl_cap_hh = 20;

x.psi_rl_hh = 0.15;
x.psi_rl_nfc = 0.15;

x.ss_rd_apm_lcy = -2/400;
x.ss_rd_apm_fcy = 1/400;

x.psi_rd_lcy = 0.50;
x.psi_rd_fcy = 0.50;

x.ss_rl_apm_hh = 0/400; 0;
x.ss_rl_apm_nfc = 1/400; 0;

x.c1_new_rl_hh = 0.65; 0.95;
x.c1_new_rl_nfc = 0.45; 0.95;

x.c1_rl_base_hh = 0.5; 1;
x.c1_rl_base_nfc = 0.5; 1;

% Reverse engineering
x.rl_hh = 8/400; 25/400; 23/400; % what we want for steady-state
x.rl_nfc = 10/400; 6/400;

x.c0_rl_apm_hh = 0.9;
x.c0_rl_apm_nfc = 0.9;

x.ss_rona_spread = 4/400;


%=================================================

x.psi_rl_hh = 0.10;
x.c1_new_rl_hh = 0.50;

end%

