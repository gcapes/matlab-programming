function met = importfile(filename,filenum, met, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [YEAR,MONTH,DAY,HOUR,TEMPERATURE] = IMPORTFILE(FILENAME) Reads data
%   from text file FILENAME for the default selection.
%
%   [YEAR,MONETH,DAY,HOUR,TEMPERATURE] = IMPORTFILE(FILENAME, STARTROW,
%   ENDROW) Reads data from rows STARTROW through ENDROW of text file
%   FILENAME.
%
% Example:
%   [Year,Moneth,Day,Hour,Temperature] = importfile('met_mlo_insitu_1_obop_hour_1977.txt',1, 8760);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2017/03/31 11:03:46

%% Initialize variables.
if nargin<=4
    startRow = 1;
    endRow = inf;
end

%% Format string for each line of text:
%   column2: double (%f)
%	column3: double (%f)
%   column4: double (%f)
%	column5: double (%f)
%   column10: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*3s%5f%3f%3f%3f%*5*s%*6*s%*4*s%*8f%7f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', '', 'WhiteSpace', '', 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', '', 'WhiteSpace', '', 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names

met(filenum).Year = dataArray{:, 1};
met(filenum).Month = dataArray{:, 2};
met(filenum).Day = dataArray{:, 3};
met(filenum).Hour = dataArray{:, 4};
met(filenum).Temperature = dataArray{:, 5};


