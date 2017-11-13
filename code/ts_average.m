% ts_average Average time series data onto lower frequency time base
% Variables:
% hfStart: high frequency start time stamp
% hfEnd:   high frequency end time stamp
% hfData:  high frequency data
% lfStart: low frequency start time stamp
% lfEnd:   low frequency end time stamp
function remapped = ts_average(hfStart,hfEnd,hfData,lfStart,lfEnd)
	
	lfDataLength = length(lfStart);
	% Preallocate array to contain results
	remapped = zeros(lfDataLength,1);
	for i=1:lfDataLength
		% Find data points which fall between lfStart and lfEnd
		inRange = find(hfStart > lfStart(i) & hfEnd < lfEnd(i));
		
		% Average these data points to form new lf time series
		% Exclude NaN values from result
		remapped(i) = mean(hfData(inRange),'omitnan');
	end
end