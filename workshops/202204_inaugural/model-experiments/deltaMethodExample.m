%% Simulate deleveraging


%% Clear the workspace

close all
clear
load mat/createModel.mat m



%% Chartpack
% Prepare for later reporting

ch = databank.Chartpack();
ch.Range = 0:30;
ch.Round = 8;
ch.Tiles = [3, 3];
ch.PlotSettings = {"marker", "s", "markerSize", 6};
ch.AxesExtras = { @(h) xlabel(h, "Quarters") };
ch.FigureExtras = { @(h) set(visual.hlegend("bottom", "Input scenario"), "fontSize", 20) };

ch.Transform = @(x) 100*(x-1);


ch < "GDP gap // Pct level deviations: ^100*(y_gap-1)";
ch < "Credit to GDP ratio // Pp deviations: ^100*l_to_4ny_hh";
ch < "New real credit // Pct level deviations: new_l_hh/cpi";
ch < "Portfolio defaults // Pp deviations: ^100*q_hh";
ch < "Lending conditions // Pp deviations PA: ^400*new_rl_full_spread_gap";
ch < "CAR // Pp deviations: ^100*car";
ch < "Nonperforming loans to gross loans // Pp deviations: ^100*ln_to_l_hh";
ch < "Frw provisions to gross loans // Pp deviations: ^100*af_to_l";

%% Generate dummy path for macro variables
% in this example, we will only input output gap for simplicity


% dummy values for output gap
values         = [               0.0 ...
                  1.0  1.5  2.2  2.3 ...
                  2.4  2.5  2.5  2.5 ...
                  2.2  1.8  1.2  0.8 ...
                  0.2 -0.5 -1.5 -2.2 ...
                 -2.5 -2.5 -2.5 -2.0 ...  
                 -1.7 -1.2 -0.6  0.0];

inputScenario.y_gap = Series(0:24, values/100+1);
inputScenario.y_gap(25:40) = 1;

% show the chart
draw(ch, inputScenario);

%% First simulation - replicate the path of macro variables using the model

% Add the dummy path of output gap to database for further simulations
d = steadydb(m, -10:40);

d1 = d;
d1.y_gap(0:24) = values/100+1;      

p1 = Plan.forModel(m, 1:40);
p1 = swap(p1, 1:40, ["y_gap", "shock_y_gap"]);

s1 = simulate( ...
    m, d1, 1:40 ...
    , 'prependInput', true ...
    , 'method', "stacked" ...
    , 'plan', p1 ...
);

smc1 = databank.minusControl(m, s1, d);

% show the results
ch.FigureExtras = { @(h) set(visual.hlegend("bottom", "Input scenario interpreted by the model"), "fontSize", 20) };
draw(ch, smc1);

%% Second simulation - add additional shock to make the recession stronger

% create new database of initial conditions
d2 = d;


% Add shocks identified in the first simulation to the input database
d2.shock_y_gap = s1.shock_y_gap;

% Add additional shock 
d2.shock_y_gap(12) = d2.shock_y_gap(12) - 0.75/100*1i;
d2.shock_y_gap(13) = d2.shock_y_gap(13) - 0.75/100*1i;
d2.shock_y_gap(14) = d2.shock_y_gap(14) - 0.75/100*1i;

s2 = simulate( ...
    m, d2, 1:40 ...
    , 'prependInput', true ...
    , 'method', "stacked" ...
);

s    = databank.merge("horzcat", s1, s2);
smc2 = databank.minusControl(m, s, d);

% show the results
ch.FigureExtras = { @(h) set(visual.hlegend("bottom", "Input scenario interpreted","Larger GPD downturn"), "fontSize", 20) };
ch.Highlight = 12:30;
draw(ch, smc2);

%% Third simulation - add additional shock to bank capital

% create new database of initial conditions
d3 = d;


% Add shocks identified in the first simulation to the input database
d3.shock_y_gap = s1.shock_y_gap;

% Add shock to increase risk weights from 40% to 50% in period 5
d3.shock_riskw(15) = 0.05*1i;

s3 = simulate( ...
    m, d3, 1:40 ...
    , 'prependInput', true ...
    , 'method', "stacked" ...
);

s    = databank.merge("horzcat", s1, s3);
smc3 = databank.minusControl(m, s, d);

% show the results
ch.FigureExtras = { @(h) set(visual.hlegend("bottom", "Input scenario interpreted","Increase in risk weights"), "fontSize", 20) };
ch.Highlight = 15:30;
draw(ch, smc3);

%% Fourth simulation - unexpected shock to return on non-loan assets

% create new database of initial conditions
d4 = d;

% Add shocks identified in the first simulation to the input database
d4.shock_y_gap = s1.shock_y_gap;

% Add shock to lower return on other assets by 2pp for one year
d4.shock_rona(15:18) = -1/400*1i;

s4 = simulate( ...
    m, d4, 1:40 ...
    , 'prependInput', true ...
    , 'method', "stacked" ...
);

s    = databank.merge("horzcat", s1, s4);
smc4 = databank.minusControl(m, s, d);

% show the results
ch.FigureExtras = { @(h) set(visual.hlegend("bottom", "Input scenario interpreted","2pp lower return on non-loan assets"), "fontSize", 20) };
draw(ch, smc4);

%% Fifth simulation - 3pp rate hike

% create new database of initial conditions
d5 = d;

% Add shocks identified in the first simulation to the input database
d5.shock_y_gap = s1.shock_y_gap;

% Add shock to lower return on other assets by 2pp for one year
d5.shock_r(15) = 3/400*1i;

s5 = simulate( ...
    m, d5, 1:40 ...
    , 'prependInput', true ...
    , 'method', "stacked" ...
);

s    = databank.merge("horzcat", s1, s5);
smc5 = databank.minusControl(m, s, d);

% show the results
ch.FigureExtras = { @(h) set(visual.hlegend("bottom", "Input scenario interpreted","3pp rate hike"), "fontSize", 20) };
draw(ch, smc5);

%% Sixth simulation - lower default rates by 0.5pp for extended period of time

% create new database of initial conditions
d6 = d;

% Add shocks identified in the first simulation to the input database
d6.shock_y_gap = s1.shock_y_gap;

% Add shock to lower default rates by 0.25pp for extended period of time
d6.shock_q(15:30) = -0.25/100*1i;

s6 = simulate( ...
    m, d6, 1:40 ...
    , 'prependInput', true ...
    , 'method', "stacked" ...
);

s    = databank.merge("horzcat", s1, s6);
smc6 = databank.minusControl(m, s, d);

% show the results
ch.FigureExtras = { @(h) set(visual.hlegend("bottom", "Input scenario interpreted","Prolonged 0.25pp lower default rates"), "fontSize", 20) };
draw(ch, smc6);
