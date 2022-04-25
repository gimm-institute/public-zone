function x = bankCapital(x)

% Calibrate bank capital

x.c0_riskw = 0.8;
x.c0_car_min = 0.8;

x.ss_onfx = 0; % including off-balance sheet items
x.ss_riskw   = 0.4; 
x.ss_car_min = 10/100;
x.ss_car_exc = 3/100;


x.floor_rbk = -10; -2;
x.c1_bk = 1; 5; 10;

x.c1_rx = 5/400; % y0[x=0]
x.c2_rx = 0.007; 0.02; % sigma
x.c3_rx = 0.75; % nu
x.c4_rx = -4/400; % low-y0
x.c5_rx = 0.5/400; % high-y0

% x.c1_rx = 0.50/400;
% x.c2_rx = 0.004;
% x.c3_rx = 0;
% x.c4_rx = -x.ss_rx;
% x.c5_rx = 4.50/400;
% 

x.c1_rbk_other = 0;


% Other assets

x.ss_ona_to_tna = 0.65; 
x.c0_ona = 0.8;


% Regulatory capital

x.ss_bg_to_bk = 0.8;
x.c0_bg_to_bk = 0.9;


%==================================
% 
% x.c1_rx = 10/400;
% x.c2_rx = 0.005;
% x.c4_rx = -9/400;
% x.c5_rx = 0.5/400;
% x.xx_car_exc = 4/100;

end%
