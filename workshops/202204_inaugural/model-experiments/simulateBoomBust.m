%% Simulate deleveraging


%% Clear the workspace

close all
clear
load mat/createModel.mat m



%% Design the simulation

m.c1_y_gap = 0.02;
m.c3_y_gap = 0.16;
m.c1_roc_y_tnd = 0.001;
m.c1_fws_y = 0.01;
m.c1_bk = 0.5;

m.c2_q_hh = 0.019;
m.c5_q_hh = 4/100;

m.c1_z_hh = 0.50;
m.c2_q_hh = 0.019;

m = steady(m);
checkSteady(m);
m = solve(m);
d = steadydb(m, -10:40);

%% Boom (asset prices, credit demand)

T = 12;
d1 = d;
d1.shock_bubble(1:T) = log(1.03);
d1.shock_ivy_tnd_hh(1:T) = log(1.03);

s1 = simulate( ...
    m, d1, 1:40 ...
    , 'prependInput',true ...
    , 'method',"stacked" ...
);


%% Boom with ccy buffers

p2 = Plan.forModel(m, 1:40);
p2 = swap(p2, 1:T, ["car_min", "shock_car_min"]);

d2 = d1;
d2.car_min(0:T) = linspace(m.car_min, m.car_min+2.5/100, T+1);

s2 = simulate( ...
    m, d2, 1:40 ...
    , 'prependInput', true ...
    , 'method', "stacked" ...
    , 'plan', p2 ...
);


%% Bust

p3 = Plan.forModel(m, T+1:40);
p3 = swap(p3, T+1, ["bubble", "shock_bubble"]);
p3 = swap(p3, T+1, ["ivy_tnd_hh", "shock_ivy_tnd_hh"]);

d3 = s1;
d3.bubble(T+1) = 1;
d3.ivy_tnd_hh(T+1) = real(m.ivy_hh);

s3 = simulate( ...
    m, d3, T+1:40 ...
    , 'prependInput', true ...
    , 'method', "stacked" ...
    , 'plan', p3 ...
);


%% Bust with ccy buffers

p4 = p3;
p4 = swap(p4, T+1, ["car_min", "shock_car_min"]);

d4 = s2;
d4.bubble(T+1) = 1;
d4.ivy_tnd_hh(T+1) = real(m.ivy_hh);
d4.car_min(T+1) = m.ss_car_min;

s4 = simulate( ...
    m, d4, T+1:40 ...
    , 'prependInput', true ...
    , 'method', "stacked" ...
    , 'plan', p4 ...
);


%% Merge databanks

s = databank.merge("horzcat", s3, s4);
smc1 = databank.minusControl(m, s3, d);
smc2 = databank.minusControl(m, s, d);



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
ch < "Proxy for asset prices // Pct level deviations: pa";
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

info1 = draw(ch, smc1);

ch.FigureExtras = { @(h) set(visual.hlegend("bottom", "Boom-bust", "Boom-bust with countercyclical buffers"), "fontSize", 20) };
info2 = draw(ch, smc2);

figure;
subplot(221);
  plot(0:40, [s3.car s3.car_min]*100,"marker", "s", "markerSize", 6, "Linewidth",3);
  title('Without macroprudential policy');
  legend('Actual CAR (%)','Effective minimum CAR (%)');
  visual.highlight(0:T);
subplot(223);
  plot(0:40, [s3.car-s3.car_min]*100,"marker", "s", "markerSize", 6, "Linewidth",3);
  title('Without macroprudential policy');
  legend('CAR Buffer (pp)');  
  visual.highlight(0:T);
subplot(222);
  plot(0:40, [s4.car s4.car_min]*100,"marker", "s", "markerSize", 6, "Linewidth",3);
  title('With macroprudential policy');
  legend('Actual CAR (%)','Effective minimum CAR (%)');
  visual.highlight(0:T);
subplot(224);
  plot(0:40, [s4.car-s4.car_min]*100,"marker", "s", "markerSize", 6, "Linewidth",3);
  title('With macroprudential policy');
  legend('CAR buffer (pp)');  
  visual.highlight(0:T);
