%% Import data from text file.
% Script for importing data from the following text file:
%
%    /home/gerard/Dropbox (The University of Manchester)/rit-training/course-material/matlab/matlab-programming/co2_weekly_mlo.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2017/03/06 14:43:33

%% Initialize variables.
filename = 'data/co2_weekly_mlo.txt';
delimiter = {',',' '};
startRow = 50;

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column9: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%*q%*q%*q%f%*s%*s%*s%*s%*s%*s%*s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
co2Year = dataArray{:, 1};
co2Month = dataArray{:, 2};
co2Day = dataArray{:, 3};
co2DecimalYear = dataArray{:, 4};
co2Conc = dataArray{:, 5};
co2Increase1800 = dataArray{:, 6};


%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;