function met = loadfolder(filespec)
% loadfolder Load a folder of text files matching filespec
% Example usage: 
%     met = loadfolder('met_mlo*.txt');

    % Create structure containing info about files.
    dirinfo = dir(filespec);
    nfiles = size(dirinfo,1);
    
    % Loop through files, calling data loader on each of them.
    % Create an empty structure to load data into
    met = struct;
    for i=1:nfiles
        filename=dirinfo(i).name;
        met = importfile(filename,i,met);
    end
end