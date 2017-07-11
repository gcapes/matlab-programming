% Find time overlap between time series
t_overlap = find_overlap(co2_t,co2_t + caldays(7),met.t,met.t + hours(1));

% Create arrays for start and end time stamps for overlapping time period
overlaptStart=t_overlap(1):calmonths(1):t_overlap(2);
overlaptEnd=t_overlap(1)+calmonths(1):calmonths(1):t_overlap(2)+calmonths(1);

tempMonthly=ts_average(met.t,met.t+hours(1),met.Temperature,overlaptStart,overlaptEnd);

%% Plot time series for visual confirmation of correct remapping
plot(overlaptStart,co2Monthly)
hold on
yyaxis right
plot(overlaptStart,tempMonthly)
legend('CO_2','Temp','Location','NorthWest')
ylabel ('Concentration (ppb)')
yyaxis left
ylabel('Temperature (\circ C)')
xlabel('Date')

%% Plot scatter to show (lack of) correlation
co2Monthly=ts_average(co2_t,co2_t+calweeks(1),co2ppm,overlaptStart,overlaptEnd);
figure
plot(overlaptStart,co2Monthly)
hold on
plot(co2_t,co2ppm)
figure % Create new figure
plot(co2Monthly,tempMonthly,'x')
