%% Process data
% back up raw co2 data
co2_raw=co2ppm;
% remove bad data points
co2ppm(co2ppm<0)=nan;