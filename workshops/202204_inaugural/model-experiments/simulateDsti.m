%% Simulate boom with debt to income caps


%% Clear the workspace

close all
clear
load mat/createModel.mat m



%% Prepare the model

m.c1_y_gap = 0.02;
m.c3_y_gap = 0.16;
m.c1_roc_y_tnd = 0.001;
m.c1_fws_y = 0.01;
m.c1_bk = 0.5;

m.c2_q_hh = 0.019;
m.c5_q_hh = 4/100;

m.c1_z_hh = 0.50;
m.c2_q_hh = 0.019;

m.c1_new_rl_cap_hh = 50;
m.c2_ivy_hh = 2;

m = steady(m);
checkSteady(m);
m = solve(m);
d = steadydb(m, -10:40);


%% Boom (asset prices, credit demand) with no DSTI caps

T = 12;
d1 = d;
d1.shock_bubble(1:T) = log(1.03);
d1.shock_ivy_tnd_hh(1:T) = log(1.03);

s1 = simulate( ...
    m, d1, 1:40 ...
    , 'prependInput',true ...
    , 'method',"stacked" ...
);


%% Boom with DSTI-like caps

d2 = d1;
d2.cap_hh(:) = 0.65;
d2.shock_cap_hh(:) = d2.cap_hh - m.ss_cap_hh;

m.c1_new_rl_full_hh = 0.3;

s2 = simulate( ...
    m, d2, 1:40 ...
    , 'prependInput', true ...
    , 'method', "stacked" ...
);


%% Merge databanks

s = databank.merge("horzcat", s1, s2);
smc = databank.minusControl(m, s, d);

% smc = databank.retrieveColumns(smc, 1);


%% Chartpack

ch = databank.Chartpack();
ch.Range = 0:40;
ch.Round = 8;
ch.Tiles = [3, 3];
ch.Highlight = 0:T;
ch.PlotSettings = {"marker", "s", "markerSize", 6};
ch.AxesExtras = { @(h) xlabel(h, "Quarters") };
ch.FigureExtras = { @(h) set(visual.hlegend("bottom", "Boom-bust"), "fontSize", 20) };

ch.Transform = @(x) 100*(x-1);

ch < "GDP // Pct level deviations: y";
ch < "GDP gap // Pct level deviations: ^100*(y_gap-1)";
% ch < "Short-term policy rate // Pp deviations: ^400*r";
% ch < "CPI inflation Q/Q PA // Pp deviations: roc_cpi^4"; 
% ch < "Nominal exchange rate // Pct level deviations: e";
ch < "Credit to GDP ratio // Pp deviations: ^100*l_to_4ny_hh";
ch < "New real credit // Pct level deviations: new_l_hh/cpi";
ch < "New credit to GDP ratio // Pp deviations: ^100*new_l_to_ny_hh";
ch < "Proxy for asset prices // Pct level deviations: mv";
% ch < "Future expected disc. GDP sum // Pct level deviations:fws_y";

ch < "//";

ch < "Portfolio defaults // Pp deviations: ^100*q_hh";
ch < "Cost of bank capital // Pp deviations PA: ^400*rx";
ch < "Credit conditions // Pp deviations PA: ^400*new_rl_full_spread_gap";
ch < "Stock lending rates // PP deviations PA: ^400*rl_hh";
ch < "CAR // Pp deviations: ^100*car";
ch < "Min CAR // Pp deviations: ^100*car_min";

ch < "//";

ch < "Bkw provisions to gross loans // Pp deviations: ^100*ap_to_l";
ch < "Frw provisions to gross loans // Pp deviations: ^100*af_to_l";
ch < "Nonperforming loans to gross loans // Pp deviations: ^100*ln_to_l_hh";
ch < "Writeoffs to gross loans // Pp deviations: ^100*woff_to_l_hh";

info1 = draw(ch, smc);

visual.hlegend("bottom", "No DTI caps", "DTI caps");


%% Plot new loans to GDP

figure();
h = plot(0:40, [s.new_l_to_ny, s.cap_hh{:, 2}], "marker", "s");
set(h(3), "color", 0.5*[1,1,1], "lineWidth", 5, "marker", "none");
title("New loans to GDP ratio");


