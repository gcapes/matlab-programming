%% Load data and calculate statistics
load clipping_data.mat

% Explanation:
% ------------
% All the variables just loaded are unsigned 16-bit integers.
% Some of the calculations below yield double precision results;
% others yield integer results.

% A matrix can only contain one data type, so if you try to put
% numbers of a differing types into a matrix (e.g. uint16 and 
% double, as we have here), MATLAB will automatically
% convert some of the types.
%
% The results array is constructed using square brackets, but contains
% different variable types i.e.
% [double, double, double, uint16; double, double, double, uint16]
%
% As such, the double precision numbers have been converted to unsigned
% 16-bit integers.
% The maximum value for this data type is intmax('uint16')
% i.e. 2^16 -1 = 65535.
% Larger values are simply assigned the maximum value this
% number type can store, so they are clipped at 65535.
% Converting this array to double afterwards using the double function
% cannot rescue the situation as the clipping has already occurred.

% Solution:
% ---------
% Convert the integer variables to double before creating the 
% summary matrix.
%
% Alternative solution:
% If the summary values are to be used for further calculations,
% it is useful to have them stored in a matrix.
% If they are just for disply purposes, we could create a cell 
% array instead using {}.

% F2_2
 
F2_2N = mean(F2_2);
F2_2M = mean(F2_2N,2);
F2_2T = sum(F2_2);
F2_2S = sum(F2_2T,2);
F2_2X = nnz(F2_2);
F2_2MMAX = double(max(F2_2));
F2_2MAX = double(max(F2_2MMAX,[],2));

% F2_3
 
F2_3N = mean(F2_3);
F2_3M = mean(F2_3N,2);
F2_3T = sum(F2_3);
F2_3S = sum(F2_3T,2);
F2_3X = nnz(F2_3);
F2_3MMAX = double(max(F2_3));
F2_3MAX = double(max(F2_3MMAX,[],2));

%% Make summary table
A = [F2_2M F2_2S F2_2X F2_2MAX ; F2_3M F2_3S F2_3X F2_3MAX];

% Ensure the problem does not recur
assert(isa(A,'double'))