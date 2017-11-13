% Find time overlap between time series
t_overlap = find_overlap(co2Time,co2Time + caldays(7),met.t,met.t + hours(1));

% Create arrays for start and end time stamps for overlapping time period
overlaptStart = t_overlap(1):calmonths(1):t_overlap(2);
overlaptEnd = t_overlap(1)+calmonths(1):calmonths(1):t_overlap(2)+calmonths(1);

co2Monthly  = ts_average(co2Time,co2Time+calweeks(1),co2Conc,overlaptStart,overlaptEnd);
tempMonthly = ts_average(met.t,met.t+hours(1),met.Temperature,overlaptStart,overlaptEnd);

%% Plot time series for visual confirmation of correct remapping
% CO2 data
figure('Name','Averaged CO2')
plot(co2Time,co2Conc)
hold on
plot(overlaptStart,co2Monthly)
ylabel ('Concentration (ppb)')
legend('Processed weekly data','Monthly averages','Location','NorthWest')
title('CO_2 at Mauna Loa, Hawaii')
xlabel('Date')
SetAxisTicks();

% Temperature data
figure('Name','Averaged temperature')
plot(met.t,met.Temperature)
hold on
plot(overlaptStart,tempMonthly)
legend('Hourly','Monthly averages','Location','NorthWest')
ylabel('Temperature (\circ C)')
xlabel('Date')
title('Temperature at Mauna Loa, Hawaii')
SetAxisTicks();

%% Time series of averaged data
figure('Name','Average data time series')
plot(overlaptStart,co2Monthly)
ylabel('Concentration (ppm)')
hold on
yyaxis right
plot(overlaptStart,tempMonthly)
ylabel('Temperature (\circ C)')
legend('CO_2','Temperature','Location','NorthWest')
title('Monthly averaged data time series')
xlabel('Date')
SetAxisTicks();

%% Plot scatter to show (hardly any) correlation
figure('Name','Temp vs CO2 scatterplot')
scatter(co2Monthly,tempMonthly)
title('Temp vs CO2')
xlabel('Concentration (ppm)')
ylabel('Temperature (\circ C)')

%% Set x axis limit and ticks for time series
function SetAxisTicks()
    xlim(datetime([1975,2020],1,1))
    ax = gca;
    ax.XTick = datetime(1975:5:2020,1,1);
end
