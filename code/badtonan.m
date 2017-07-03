% badtonan replaces data points less than a value with NaN
% Example usage: co2ppm=badtonan(co2_raw,0);
function [fixed]=badtonan(data,threshold)
    % Copy the raw data
    fixed=data;
    % Replace values less than threshold with NaN
    fixed(data<threshold)=NaN;
end