
close all
clear

load mat/simulateBoomBust.mat m s T smc

primaryColor = [0.6, 0, 0];
primaryColor2 = [0, 0, 0.6];
steadyColor = [0.6, 0.6, 0.9];
mutedColor = [0.9, 0.6, 0.6];
mutedColor2 = [0.6, 0.6, 0.9];
xlineColor = 0.7*[1, 1, 1];
minColor = mutedColor;


sw = true;

figure();
pdr1AxesH = subplot(3, 2, 1, "nextPlot", "add");
car1AxesH = subplot(3, 2, 2, "nextPlot", "add");

gdpAxesH = subplot(3, 2, 3, "nextPlot", "add");
xlabel(gdpAxesH, "Quarters");
title(gdpAxesH, "Real GDP");
carAxesH = subplot(3, 2, 4, "nextPlot", "add");
xlabel(carAxesH, "Quarters");
title(carAxesH, "CAR")

[~, min1H] = drawCapitalAdequacyRiskFunc(car1AxesH, m, m.car_min);
set(min1H, "color", minColor);
drawDefaultRateFunc(pdr1AxesH, m);

plot(gdpAxesH, 0:20, 100*(smc.y-1), "lineStyle", "none");
plot(carAxesH, 0:20, 100*(s.car), "lineStyle", "none");

if sw
    pdr2AxesH = subplot(3, 2, 5, "nextPlot", "add");
    car2AxesH = subplot(3, 2, 6, "nextPlot", "add");

    [curve2H, min2H] = drawCapitalAdequacyRiskFunc(car2AxesH, m, m.car_min);
    set(min2H, "color", minColor);
    drawDefaultRateFunc(pdr2AxesH, m);
end


markerStyle = @(h) set(h, "color", primaryColor, "marker", "s", "markerSize", 12, "markerFaceColor", primaryColor);
markerStyle2 = @(h) set(h, "color", primaryColor2, "marker", "s", "markerSize", 12, "markerFaceColor", primaryColor2);
muteMarker = @(h) set(h, "color", mutedColor, "markerFaceColor", mutedColor);
muteMarker2 = @(h) set(h, "color", mutedColor2, "markerFaceColor", mutedColor2);
xlineStyle = @(h) set(h, "lineWidth", 7, "color", xlineColor);


for t = 0 : 20

    pdr1H = plot(pdr1AxesH, 100*s.z_hh(t, 1), 100*s.q_hh(t, 1));
    markerStyle(pdr1H);

    car1H = plot(car1AxesH, 100*s.car(t, 1), 400*s.rx(t, 1));
    markerStyle(car1H);

    gdp1H = plot(gdpAxesH, t, 100*(smc.y{t, 1}-1));
    markerStyle(gdp1H);

    car1tH = plot(carAxesH, t, 100*(s.car{t, 1}));
    markerStyle(car1tH);

    if sw
        gdp2H = plot(gdpAxesH, t, 100*(smc.y{t, 2}-1));
        markerStyle2(gdp2H);
        car2tH = plot(carAxesH, t, 100*(s.car{t, 2}));
        markerStyle2(car2tH);
    end


    if sw
        [curve2H, min2H] = drawCapitalAdequacyRiskFunc(car2AxesH, m, s.car_min(t, 2));
        set(min2H, "color", mutedColor);

        pdr2H = plot(pdr2AxesH, 100*s.z_hh(t, 2), 100*s.q_hh(t, 2));
        markerStyle(pdr2H);

        car2H = plot(car2AxesH, 100*s.car(t, 2), 400*s.rx(t, 2));
        markerStyle(car2H);
    end

    if any(t==[0, T+1])
        xlineStyle(xline(car1AxesH, 100*s.car(t, 1)));
        xlineStyle(xline(pdr1AxesH, 100*s.z_hh(t, 1)));
        if sw
            xlineStyle(xline(pdr2AxesH, 100*s.z_hh(t, 2)));
        end
        visual.highlight(gdpAxesH, t);
        visual.highlight(carAxesH, t);
    end

    pause();

    muteMarker(car1H);
    muteMarker(pdr1H);

    muteMarker(gdp1H);
    muteMarker(car1tH);

    if sw
        muteMarker2(gdp2H);
        muteMarker2(car2tH);

        set(car2H, "color", mutedColor, "markerFaceColor", mutedColor);
        set(pdr2H, "color", mutedColor, "markerFaceColor", mutedColor);

        set(curve2H, "color", xlineColor);
        set(min2H, "color", xlineColor);
    end
end

