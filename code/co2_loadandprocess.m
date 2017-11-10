% Script to load CO2 data, remove bad data points and create a time series.

% Load data
co2_load;

% Back up raw data
co2ConcRaw = co2Conc;
% Remove bad data points
co2Conc = badtonan(co2ConcRaw,0);

% Create time series
co2Time = datetime(co2Year,co2Month,co2Day);

% Plot time series
plot(co2Time,co2Conc);
ylabel('Concentration (ppm)');
legend('CO_2','Location','NorthWest')
xlabel('Date')
title('CO_2 at Mauna Loa, Hawaii')
xlim(datetime([1970, 2020],1,1));