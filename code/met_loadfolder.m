function met = met_loadfolder(filespec)
% loadfolder Load text files in the current folder matching filespec
% Example usage: 
%     met = met_loadfolder('met_mlo*.txt');

    % Create structure containing info about files.
    dirinfo = dir(filespec);
    nfiles = size(dirinfo,1);
    
    % Create an empty structure to load data into
    met = struct;
    
    % Loop through files, calling data loader on each of them.
    for i=1:nfiles
        filename=dirinfo(i).name;
        met = met_importfile(filename,i,met);
    end
end
