%% Clear the workspace

close all
clear
load mat/createModel.mat m



%% Design the simulation

m.c1_prem = 0.005;
m = steady(m);
m = solve(m);

m1 = alter(m, 2);
m1.ss_car_min = m1.ss_car_min + 2.5/100;
m1.c0_car_min = [0, 0.8];
m1.c1_bk = [0.5, 1];


m1 = steady(m1);
checkSteady(m1);
m1 = solve(m1);



%% Run simulations

d1 = steadydb(m, -10:40);

% Immediate unanticipated increase
s1 = simulate( ...
    m1(1), d1, 1:40 ...
    , 'prependInput',true ...
    , 'method',"stacked" ...
);


% Immediate unanticipated increase with flat policy rate
p = Plan.forModel(m, 1:40);
p = swap(p, 1:8, ["r", "shock_r"]);

s2 = simulate( ...
    m1(1), d1, 1:40 ...
    , 'prependInput',true ...
    , 'method',"stacked" ...
    , 'plan',p ...
);


% Gradual increase
s3 = simulate( ...
    m1(2), d1, 1:40 ...
    , 'prependInput',true ...
    , 'method',"stacked" ...
);


% Gradual announced/anticipated increase starting at beginning of year 3
p = Plan.forModel(m, 1:40);
p = swap(p, 1:8, ["car_min", "shock_car_min"]);

s4 = simulate( ...
    m1(2), d1, 1:40 ...
    , 'prependInput',true ...
    , 'method',"stacked" ...
    , 'plan',p ...
);

s = databank.merge("horzcat", s1, s2, s3, s4);

smc = databank.minusControl(m1, s, d1);



%% Chartpack

ch = databank.Chartpack();
ch.Range = 0:40;
ch.Round = 8;
ch.Tiles = [3, 3];
ch.PlotSettings = {"marker", "s", "markerSize", 6};
ch.AxesExtras = { @(h) xlabel(h, "Quarters") };

ch.Transform = @(x) 100*(x-1);

ch < "GDP // Pct level deviations: y";
ch < "Cum GDP gap // Pct level deviations: ^100/4*cumsum(y_gap-1)";
ch < "Short-term policy rate // Pp deviations: ^400*r";
ch < "CPI inflation Q/Q PA // Pp deviations: roc_cpi^4"; 
ch < "Nominal exchange rate // Pct level deviations: e";
ch < "Credit to GDP ratio // Pp deviations: ^100*l_to_4ny_hh";
ch < "New real credit // Pct level deviations: new_l_hh/cpi";

ch < "---";

ch < "Portfolio defaults // Pp deviations: ^100*q_hh";
ch < "Cost of bank capital // Pp deviations PA: ^400*rx";
ch < "Credit conditions // Pp deviations PA: ^400*new_rl_full_spread_gap";
ch < "Stock lending rates // PP deviations PA: ^400*rl_hh";
ch < "CAR // Pp deviations: ^100*car";
ch < "Min CAR // Pp deviations: ^100*car";

ch < "---";

ch < "Bkw provisions to gross loans // Pp deviations: ^100*ap_to_l";
ch < "Frw provisions to gross loans // Pp deviations: ^100*af_to_l";
ch < "Nonperforming loans to gross loans // Pp deviations: ^100*ln_to_l_hh";
ch < "Writeoffs to gross loans // Pp deviations: ^100*woff_to_l_hh";

info = draw(ch, smc);

visual.hlegend( ...
    "bottom" ...
    , "Immediate unanticipated" ...
    , "Immediate unanticipated with flat policy rate" ...
    , "Gradual unanticipated" ...
    , "Gradual anticipated 2Y ahead" ...
);
