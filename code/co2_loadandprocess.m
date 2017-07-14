% Script to load CO2 data, remove bad data points and create a time series.

% Load data
co2_load;

% Back up raw data
co2_raw=co2ppm;
% Remove bad data points
co2ppm=badtonan(co2_raw,0);

% Create time series
co2_t = datetime(year,month,day);

% Plot time series
plot(co2_t,co2ppm);
ylabel('Concentration (ppm)');
legend('CO_2','Location','NorthWest')
xlabel('Date')
title('CO_2 at Mauna Loa, Hawaii')