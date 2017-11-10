% BADTONAN replaces data points less than a threshold value with NaN
% Usage:
% goodData = badtonan(rawData, implausiblyLowValue)
function [cleaned] = badtonan(rawData,threshold)
    % Copy the raw data
    cleaned = rawData;
    % Replace values less than threshold with NaN
    cleaned(cleaned < threshold) = NaN;
end
