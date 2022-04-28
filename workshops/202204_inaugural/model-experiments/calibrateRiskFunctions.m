
%% 

close all
clear

load mat/createModel.mat m

x = access(m, 'steady-level');


%% Capital adequacy risk

car = linspace(x.car_min-0.02, x.car_min+0.05, 500);
car = reshape(car, [], 1);
rx = glogc1(-(car - x.car_min), x.c1_rx, x.c2_rx, x.c3_rx, x.c4_rx, x.c5_rx);
d = glogd1(-(x.car - x.car_min), x.c1_rx, x.c2_rx, x.c3_rx, x.c4_rx, x.c5_rx);
rx1 = x.rx - d*(car - x.car);

figure();
hold on
h = plot(100*car, 400*[rx, rx1]);
set(h(2), "lineStyle", ":");
set(gca(), "xLim", 100*[min(car), max(car)], "yLim", 400*[0, max(rx)], "fontSize", 25);

xline(100*x.car_min, "-", "Min CAR", "lineWidth", 10, "color", [0.8,0.5,0.5], "fontSize", 20);
xline(100*(x.car_min+x.ss_car_exc), "-", "Steady-state CAR", "lineWidth", 10, "color", [0.7,0.7,0.7], "fontSize", 20);
title("Capital adequacy stress function");
xlabel("Standard capital adequacy ratio [%]");
ylabel("Impact on credit conditions [% PA]");

% print -dpng car-function


%% Credit risk

z = linspace(-0.10, 0.10, 500);
z = reshape(z, [], 1);
q = glogc1(-z, x.ss_q_hh, x.c2_q_hh, x.c3_q_hh, x.c4_q_hh, x.c5_q_hh);
d = glogd1(0, x.ss_q_hh, x.c2_q_hh, x.c3_q_hh, x.c4_q_hh, x.c5_q_hh);
q1 = x.ss_q_hh-d*z;

figure();
hold on
h = plot(100*z, 100*[q, q1]);
set(h(2), "lineStyle", ":");
set(gca(), "yLim", [0, 100*round(max(q+0.005),2)], "xLim", 100*z([1,end]), "fontSize", 25);
xline(0, "-", "Steady-state macro conditions", "lineWidth", 10, "color", [0.7,0.7,0.7], "fontSize", 20);

title("Credit portofolio default function");
xlabel("Macroeconomic conditions index [%]");
ylabel("Bank credit portfolio default rate [%]");

% print -dpng credit-risk-function

