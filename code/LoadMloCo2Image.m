% Load image file and plot data on top of it.
% "Tidy up" image by removing logos and text

I = imread('data/co2_data_mlo.png');

% Back up loaded image - we're bound to make mistakes.
Ibackup = I;

% View image in MATLAB
imshow(I);

%% Clean up image

% Manually find regions we want to "erase" using data cursor (the text in
% the plot area).
xRange = [126:513];
yRange = [94:143];

% Manually determine what the background colour value is
backgroundColour = 255;

% "Erase" the text
I(yRange,xRange,:) = backgroundColour;

% "Erase" the logos
xRange = [467:648];
yRange = [361:448];
I(yRange,xRange,:) = backgroundColour ;

% Review changes
figure;
imshow(I);

%% Crop plot area
% A suitable axis range for new plot might be 1970 - 2020
% Determine scaling of image using data cursor on the axes:
% 1960 is at x = 137
% 1965 is at x = 181
% 1970 is at x = 225
% So 5 years = 225 - 181 = 44
%              181 - 137 = 44   (just double checking!)
% 2015 is at x = 621, so 2020 would be 621 + 44 = 665.
% 320 ppb is at y = 414
% 340 ppb is at y = 336
% 360 ppb is at y = 258
% So 20 ppb = 413 - 337 = 78.
%           = 337 - 258 = 78. (double check)

% Now create a new matrix for the image over the x axis range 1970 - 2020
% and y axis range 320 - 410
% Read values using data cursor, or calculate them based on the above
yearMin = 225;              % x value for 1970
yearMax = 621 + 44;         % x value for 2015 + 5 years.
xRange = [yearMin:yearMax];
concMin = 414;              % y value for 320
concMax = 63;               % y value for 410
yRange = [concMax:concMin];
I = I(yRange,xRange,:);
yRange = [1:5];
I(yRange,:,:) =  backgroundColour;

%% Further tidy up plot, "erasing" leftover sections of axes
I(:,423:441,:) = backgroundColour;
I(1:5,:,:) = backgroundColour;

imshow(I);

%% Display the cleaned up image and plot our data on top
% Non-toolbox technique

% Flip matrix so that y axis origin is at the bottom instead of the top
I = flipud(I);
close
figure('Name','CO2 vs screenshot')
imshow(I);
axis on

% Set origin of y-axis at the bottom
set(gca,'YDir','normal');

% Use custom ticks and tick labels for axes
YEAR_MIN = 1970;
YEAR_MAX = 2020;
YEAR_RANGE = YEAR_MAX - YEAR_MIN;
IMAGE_X_MAX = size(I,2);
xTickPosition = IMAGE_X_MAX / YEAR_RANGE * (0:5:YEAR_RANGE);
xTickPositionLabel = YEAR_MIN:5:YEAR_MAX;
xticks(xTickPosition)
xticklabels(xTickPositionLabel)
xlim([0,IMAGE_X_MAX])

CONC_MIN = 320;
CONC_MAX = 410;
CONC_RANGE = CONC_MAX - CONC_MIN;
IMAGE_Y_MAX = size(I,1);
yTickPosition = IMAGE_Y_MAX / CONC_RANGE * (0:10:CONC_RANGE);
yTickPositionLabel = CONC_MIN:10:CONC_MAX;
yticks(yTickPosition)
yticklabels(yTickPositionLabel)
ylim([0,IMAGE_Y_MAX])

% Remap date and concentration values using image scaling
co2ConcRemap = IMAGE_Y_MAX * (co2_conc - CONC_MIN) / CONC_RANGE;
co2DecimalYearRemap = IMAGE_X_MAX * (co2_decimalyear - YEAR_MIN) / YEAR_RANGE;

% Plot our remapped data on top of image.
hold on
plot(co2DecimalYearRemap,co2ConcRemap)

% Essential labelling
legend('Our CO_2 data','Location','NorthWest')
xlabel('Date')
ylabel('CO_2 concentration')
title('CO_2 screenshot with data overlayed')