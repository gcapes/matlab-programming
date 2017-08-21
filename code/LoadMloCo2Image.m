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
% Flip matrix so that y axis origin is at the bottom instead of the top
I = flipud(I);

% Scale image to allow plotting on top
RI = imref2d(size(I));
RI.XWorldLimits = [1970 2020];
RI.YWorldLimits = [320 410];
figure('name','Screenshot CO2 data');
imshow(I,RI);
set(gca,'YDir','normal');
daspect([1,2,1]);
xlabel('Year')
ylabel('Concentration (ppb)')
title('CO_2 at Mauna Loa')

% Plot our data on top of image.
hold on
plot(co2_decimalyear,co2_conc)
legend('Our data','location','northwest')
