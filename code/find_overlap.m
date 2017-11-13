% FIND_OVERLAP Return overlap between two time series.
%
% [overlap] = find_overlap (ts1_start,ts1_end,ts2_start,ts2_end)
%
% Returns a two-element time series array, whose first element is the
% start of the first overlapping time interval.
% The second element is the end of the last overlapping time interval.
%
% ts1_start is the time series for dataset 1 whose time stamp represents 
% the start of the time interval.
% ts1_end is the time series for data set 1 whose time stamp represents
% the end of the interval.
%
% Example usage:
% t_overlap = find_overlap(co2_t,co2_t + caldays(7),met.t,met.t + hours(1))

function [overlap] = find_overlap (ts1_start,ts1_end,ts2_start,ts2_end)
    % Check that time series are monotonic.
    mono1a = issorted(ts1_start);
    mono1b = issorted(ts1_end);
    mono2a = issorted(ts2_start);
    mono2b = issorted(ts2_end);
    % Abort with error message if input data is not monotonic.
    assert( mono1a && mono1b && mono2a && mono2b , 'Error. Time series should be monotonic.')
    
    t1_start = ts1_start(1);
    t1_end   = ts1_end(end);
    t2_start = ts2_start(1);
    t2_end   = ts2_end(end);
    
    t_start = max(t1_start,t2_start);
    t_end   = min(t1_end,t2_end);
    
    overlap = [t_start,t_end];
end