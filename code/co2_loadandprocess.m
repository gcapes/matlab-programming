% Script to load CO2 data, remove bad data points and create a time series.

% Load data
co2_load;

% Back up raw data
co2_conc_raw=co2_conc;
% Remove bad data points
co2_conc=badtonan(co2_conc_raw,0);

% Create time series
co2_t = datetime(co2_year,co2_month,co2_day);

% Plot time series
plot(co2_t,co2_conc);
ylabel('Concentration (ppm)');
legend('CO_2','Location','NorthWest')
xlabel('Date')
title('CO_2 at Mauna Loa, Hawaii')
xlim(datenum([1970, 2020],1,1));
ax = gca;
ax.XTick = datenum(1970:5:2020,1,1);
