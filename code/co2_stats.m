%% Monthly statistics
% Calculate calendar-month statistics for CO2 data
monthNames = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
[co2MonthlyMean, co2MonthlyStd, co2MonthlyMin, co2MonthlyMax] = deal(zeros(12,1));

% Filter data to get monthly statistics
for i = 1:12
    % Find indices matching each calendar month
    idx = month(co2Time) == i;
    
    % Assign results
    co2MonthlyMean(i) = mean(co2Conc(idx),'omitnan');
    co2MonthlyStd(i)  = std(co2Conc(idx),'omitnan');
    co2MonthlyMin(i)  = min(co2Conc(idx));
    co2MonthlyMax(i)  = max(co2Conc(idx));
end

co2MonthlyRange = co2MonthlyMax - co2MonthlyMin;
[co2GreatestMonthlyRange, co2MonthWithGreatestRange] = max(co2MonthlyRange);
fprintf('The month with the greatest CO_2 range is %s.\n',...
    monthNames(co2MonthWithGreatestRange))

[co2HighestMonthlyMean,co2MonthWithHighestMean] = max(co2MonthlyMean);
fprintf('The highest monthly mean was %.1f ppb, in %s.\n',...
    co2HighestMonthlyMean,monthNames(co2MonthWithHighestMean))

[co2LowestMonthlyMean,co2MonthWithLowestMean] = min(co2MonthlyMean);
fprintf('The lowest monthly mean was %.1f ppb, in %s.\n',...
    co2LowestMonthlyMean,monthNames(co2MonthWithLowestMean))


co2ErrorbarNeg = co2MonthlyMean - co2MonthlyMin;
co2ErrorbarPos = co2MonthlyMax - co2MonthlyMean;
figure('Name','Monthly CO_2 data')
errorbar((1:12),co2MonthlyMean,co2ErrorbarNeg,co2ErrorbarPos)
xlabel('Month of the year')
ylabel('Concentration (ppb)')
title('Monthly CO_2 stats 1974 - 2016')
xticks(1:12)
xticklabels(monthNames)
xlim([0,13])
annotation('textbox',[0.15,0.6,0.2,0.2],...
    'String','Error bars show max and min',...
    'FitBoxToText','on','Backgroundcolor','white')
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
    idx = year(co2Time) == i;
    
    % Start filling the array from the first row rather than the row of the
    % year, to avoid the first 1974 rows containing no data.
    statsRow = i - (startYear-1);
    co2YearlyMean(statsRow) = mean(co2Conc(idx),'omitnan');
    co2YearlyStd(statsRow)  = std(co2Conc(idx),'omitnan');
    co2YearlyMin(statsRow)  = min(co2Conc(idx));
    co2YearlyMax(statsRow)  = max(co2Conc(idx));
end

[co2HighestYearlyMean, co2YearWithHighestMean] = max(co2YearlyMean);
fprintf('The highest yearly mean concentration was %.4g, in %g.\n',...
    co2HighestYearlyMean,co2YearlyIndex(co2YearWithHighestMean))

[co2LowestYearlyMean, co2YearWithLowestMean] = min(co2YearlyMean);
fprintf('The lowest yearly mean concentration was %.4g, in %g.\n',...
    co2LowestYearlyMean,co2YearlyIndex(co2YearWithLowestMean))

co2YearlyRange = co2YearlyMax - co2YearlyMin;
[co2GreatestYearlyRange, co2YearWithGreatestRange] = max(co2YearlyRange);
fprintf('The greatest variability was in %d, with a range of %g ppb.\n',...
    co2YearlyIndex(co2YearWithGreatestRange),co2GreatestYearlyRange)

figure('Name','Yearly averaged CO_2')
errorbar(co2YearlyIndex,co2YearlyMean,co2YearlyStd,'o-')
title('Yearly averaged CO_2')
xlabel('Year')
ylabel('Concentration (ppb)')
annotation('textbox',[0.2,0.7,0.2,0.2],'String','Error bars show standard deviation','FitBoxToText','on')
