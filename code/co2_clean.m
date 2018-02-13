%% Remove bad data points from CO2 data
% back up raw co2 data
co2Raw = co2Conc;
% remove bad data points
co2Conc(co2Conc<0) = nan;