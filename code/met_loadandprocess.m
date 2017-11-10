% Load and process Met data

% load raw meteorology data from 'data' subdirectory
rawMetData = met_loadfolder('data/met_mlo*.txt');

% Combine columns within structure array
met = combinestructcols(rawMetData);

% Remove bad data points
met.Temperature = badtonan(met.Temperature,-900);

% Create timeseries array within met structure array
met.t = datetime(met.Year,met.Month,met.Day,met.Hour,0,0);