%% Monthly statistics
% Calculate calendar-month statistics for CO2 data

[co2MonthlyMean, co2MonthlyStd, co2MonthlyMin, co2MonthlyMax] = deal(zeros(12,1));
for i = 1:12
    % Find indices matching each calendar month
    idx = month(co2_t) == i;
    
    % Assign results
    co2MonthlyMean(i) = mean(co2_conc(idx),'omitnan');
    co2MonthlyStd(i)  = std(co2_conc(idx),'omitnan');
    co2MonthlyMin(i)  = min(co2_conc(idx));
    co2MonthlyMax(i)  = max(co2_conc(idx));
end

%% Yearly statistics
% Calculate yearly stats to look at variability

% Only consider data where we have measurements for the whole year -
% otherwise this may skew the statistics for those years.
startYear = 1975;
endYear = 2016;
co2YearlyIndex = startYear:endYear;
nYears = endYear - startYear + 1;

[co2YearlyMean, co2YearlyStd, co2YearlyMin, co2YearlyMax] = deal(zeros(nYears,1));
for i = co2YearlyIndex
    % Find indices matching each year
    idx = year(co2_t) == i;
    
    % Start filling the array from the first row rather than the row of the
    % year, to avoid the first 1974 rows containing no data.
    statsRow = i - 1974;
    co2YearlyMean(statsRow) = mean(co2_conc(idx),'omitnan');
    co2YearlyStd(statsRow)  = std(co2_conc(idx),'omitnan');
    co2YearlyMin(statsRow)  = min(co2_conc(idx));
    co2YearlyMax(statsRow)  = max(co2_conc(idx));
end

plot(co2YearlyIndex,co2YearlyMean)