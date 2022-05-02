%% Simulate deleveraging


%% Clear the workspace

close all
clear
load mat/createModel.mat m



%% Design the simulation
%
% Create three variants of the model with lower steady-state credit to GDP
% ratios
%

down = [0.05, 0.10, 0.20];

m1 = alter(m, numel(down));

m1.ss_l_to_4ny_hh  = m1.ss_l_to_4ny_hh - down;

m1 = steady(m1);
checkSteady(m1);
m1 = solve(m1);



%% Run simulation

d1 = steadydb(m, -10:40);

s1 = simulate( ...
    m1, d1, 1:40 ...
    , 'prependInput',true ...
    , 'method',"stacked" ...
);

smc1 = databank.minusControl(m1, s1, d1);



%% Chartpack

ch = databank.Chartpack();
ch.Range = 0:40;
ch.Round = 8;
ch.Tiles = [3, 3];
ch.Transform = @(x) 100*(x-1);
ch.PlotSettings = {"marker", "s", "markerSize", 6};
ch.AxesExtras = { @(h) xlabel(h, "Quarters") };

ch < "GDP // Pct level deviations: y";
ch < "Short-term policy rate // Pp deviations: ^400*r";
ch < "CPI inflation Q/Q PA // Pp deviations: roc_cpi^4"; 
ch < "Nominal exchange rate // Pct level deviations: e";
ch < "Credit to GDP ratio // Pp deviations: ^100*l_to_4ny_hh";
ch < "New real credit // Pct level deviations: new_l_hh/cpi";

ch < "//";

ch < "Credit conditions // Pp deviations PA: ^400*new_rl_full_spread_gap";
ch < "Portfolio defaults // Pp deviations: ^100*q_hh";
ch < "Stock lending rates // PP deviations PA: ^400*rl_hh";
ch < "Cost of bank capital // Pp deviations PA: ^400*rx";
ch < "CAR // Pp deviations: ^100*car";

ch < "//";

ch < "Bkw provisions to gross loans // Pp deviations: ^100*ap_to_l";
ch < "Frw provisions to gross loans // Pp deviations: ^100*af_to_l";
ch < "Nonperforming loans to gross loans // Pp deviations: ^100*ln_to_l_hh";

info = draw(ch, smc1);

for i = 1 : numel(info.FigureHandles)
    figure(i);
    h = visual.hlegend("bottom", "Harmless", "Severe", "Devastating");
    set(h, 'fontSize',20);
end


%% 

ch = databank.Chartpack();
ch.Range = -8:40;
ch.Round = 8;
ch.Tiles = [2, 2];
ch.PlotSettings = { {"marker"}, {"s"; "s"; "s"; "none"}, "markerSize", 6, {"lineStyle"}, {"-"; "-"; "-"; ":"}};
ch.AxesExtras = { @(h) xlabel(h, "Quarters"), @(h) ylim(h, "auto"), @(h) visual.highlight(h, 1) };

ch < "Real GDP: y";
ch < "Nominal GDP: y";
ch < "Nominal bank credit: l";
ch < "Stock lending rates: 400*rl_hh";

draw(ch, databank.merge("horzcat", s1, d1));

h = visual.hlegend("bottom", "Harmless", "Severe", "Devastating", "Control");
set(h, 'fontSize',20);



%% Visualize credit risk

figure();
titles = ["Harmless", "Severe", "Devastating"];

x = access(m, "steady-level");
z = linspace(-0.10, 0.10, 500);
q = glogc1(-z, x.ss_q_hh, x.c2_q_hh, x.c3_q_hh, x.c4_q_hh, x.c5_q_hh);

for i = 1 : countVariants(m1) 
    subplot(2, 2, i);
    hold on
    add = nan(40, i-1);
    plot([add, 100*s1.z_hh(1:40,i)], [add,100*s1.q_hh(1:40,i)], 'lineStyle',"none", 'marker',"s", 'markerSize', 15, 'lineWidth',5);
    plot(100*z, 100*q, 'color',0.5*[1,1,1], 'lineWidth',3);
    xline(0, 'lineWidth',2, 'lineStyle',":");
    set(gca(), 'yLim',[0, round(100*max(q+0.01),1)], 'xLim',100*z([1,end]));
    xlabel("Macro conditions index [%]");
    ylabel("Portfolio default rates [%]");
    title(titles(i));
end

visual.heading("Credit portofolio default function", 'fontSize',25, 'fontWeight',"bold");



%% Visualize bank capital risk

figure();
titles = ["Harmless", "Medium", "Severe"];

x = access(m, "steady-level");
q = glogc1(-z, x.ss_q_hh, x.c2_q_hh, x.c3_q_hh, x.c4_q_hh, x.c5_q_hh);

car = linspace(x.car_min-0.02, x.car_min+0.05, 500);
car = reshape(car, [], 1);
rx = glogc1(-(car - x.car_min), x.c1_rx, x.c2_rx, x.c3_rx, x.c4_rx, x.c5_rx);


for i = 1 : countVariants(m1) 
    subplot(2, 2, i);
    hold on
    add = nan(40, i-1);
    plot([add, 100*s1.car(1:40,i)], [add,400*s1.rx(1:40,i)], 'lineStyle',"none", 'marker',"s", 'markerSize',15, 'lineWidth',5);
    plot(100*car, 400*rx, 'color',0.5*[1,1,1], 'lineWidth',3);
    xline(100*x.car, 'lineWidth',2, 'lineStyle',":");
    xline(100*x.car_min, 'lineWidth',2, 'lineStyle',":");
    set(gca(), 'xLim',100*[min(car), max(car)], 'yLim',400*[0, max(rx)], 'fontSize',20);    
    xlabel("Standard capital adequacy ratio [%]");
    ylabel("Impact on credit conditions [% PA]");  
    title(titles(i));
end

visual.heading("Capital adequacy stress function", 'fontSize',25, 'fontWeight',"bold");
