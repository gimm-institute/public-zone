
close all
clear

load mat/createModel.mat m

m.c1_rona = 0.1;
m.c2_ivy_hh = 2;
m = alter(m, 5);

T = 5;
p = Plan.forModel(m, 1:40);
p = exogenize(p, T, "car");
p = endogenize(p, 1, "shock_x");

d0 = steadydb(m, 1:40);
d = d0;
d.car(T, :) = 11/100;

m.cx_y_gap = [1, 1, 0, 1, 1];
m.cx_roc_y_tnd = [0, 1/10, 0, 0, 0];
m.cx_rona = [0, 0, 1, 1/2, 1/2];

m.c0_x = [0.8, 0.8, 0.8, 0.8, 0];
d.shock_c0_x(1:7, 5) = [1; 1; 1; 1; 1; 1; 0];

checkSteady(m);
m = solve(m);

s = simulate( ...
    m, d, 1:40 ...
    , "prependInput", true ...
    , "method", "stacked" ...
    , "plan", p ...
);


%% Chart results

smc = databank.minusControl(m, s, d0);
% smc = databank.retrieveColumns(smc, 1);


ch = databank.Chartpack();
ch.Range = 0:40;
ch.Round = 8;
ch.Transform = @(x) 100*(x-1);
ch.Highlight = T;

ch < "Stress factor // Index: ^100*x";
ch < "Output // Pct level deviations: y_gap";
ch < "Potential output // Pct level deviations: y_tnd";
ch < "Nominal exchange rate // Pct level deviations: e";
ch < "Portfolio default rates // Pp deviations: ^100*q";
ch < "New lending conditions // Pp deviations: ^400*new_rl_full_spread_gap";
ch < "Return on other assets // Pp deviations: ^400*rona";
ch < "CAR // Pp deviations: ^100*car";

draw(ch, smc);

visual.hlegend("bottom" ...
    , "Domestic demand", "Domestic demand and potential output" ...
    , "Financial assets", "Domestic demand and financial assets" ...
    , "Flat profile");

