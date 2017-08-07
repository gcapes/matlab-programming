%% Optimisation example 1: preallocation
fprintf('\n')
disp('Example 1: preallocation')
clear
n = 10e6;

tic
for j = 1:n
    C(j) = randn;
end
tNoPrealloc = toc;
fprintf('Without preallocation: %g.\n',tNoPrealloc)

clear C

% Repeat with preallocated C array
tic
C = zeros(1,n);
for j = 1:n
    C(j) = randn;
end
tWithPrealloc = toc;
fprintf('With preallocation: %g.\n',tWithPrealloc)
fprintf('Ratio: %g.\n\n',tNoPrealloc/tWithPrealloc)

%% Efficiency example 2: vectorisation
disp('Example 2: vectorisation')
clear
n = 10e6;

tic
C = zeros(n,1);
for j = 1:n
    C(j) = randn;
end
tPreallocLoop = toc;
fprintf('With preallocation and loop: %g.\n',tPreallocLoop)

clear C
tic
C = randn(1,n);
tVec = toc;
fprintf('With vector assignment: %g.\n',tVec)
fprintf('Ratio: %g.\n\n',tPreallocLoop/tVec)

%% Efficiency example 3: vectorisation
disp('Example 3: vectorisation')
clear
n = 5000;
A = rand(n,n);
B = rand(n,n);
C = zeros(n,n);

tic
for k = 1:n
    for j = 1:n
        C(j,k) = A(j,k) * B(j,k);
    end
end
tLoops = toc;
fprintf('With loops: %g.\n',tLoops)

clear C
tic
C = A .* B;
tVec = toc;
fprintf('With vector assignment: %g.\n',tVec)
fprintf('Ratio: %g.\n\n',tLoops/tVec)

%% Efficiency example 4: row-wise vs column-wise array access
disp('Example 4: column-wise array access')
clear
n = 5000;
A = rand(n,n);
B = rand(n,n);
C = zeros(n,n);

tic
for j = 1:n
    for k = 1:n
        C(j,k) = A(j,k) * B(j,k);
    end
end
tRow = toc;
fprintf('Row-wise looping: %g.\n',tRow)

% Repeat with k and j loops swapped
tic
for k = 1:n
    for j = 1:n
        C(j,k) = A(j,k) * B(j,k);
    end
end
tCol = toc;
fprintf('Column-wise looping: %g.\n',tCol)
fprintf('Ratio: %g.\n\n',tRow/tCol)
