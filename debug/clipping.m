%% Load data and calculate statistics
load clipping_data.mat

% F2_2
 
F2_2N = mean(F2_2);
F2_2M = mean(F2_2N,2);
F2_2T = sum(F2_2);
F2_2S = sum(F2_2T,2);
F2_2X = nnz(F2_2);
F2_2MMAX = max(F2_2);
F2_2MAX = max(F2_2MMAX,[],2);

% F2_3
 
F2_3N = mean(F2_3);
F2_3M = mean(F2_3N,2);
F2_3T = sum(F2_3);
F2_3S = sum(F2_3T,2);
F2_3X = nnz(F2_3);
F2_3MMAX = max(F2_3);
F2_3MAX = max(F2_3MMAX,[],2);

%% Make summary table
A = double([F2_2M F2_2S F2_2X F2_2MAX ; F2_3M F2_3S F2_3X F2_3MAX]);