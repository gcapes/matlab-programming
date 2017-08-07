%% Original code, commented.

clear all
n = 2500;
B = rand(n);

tic 

% Loop over all rows
for i = 1:n
    % Loop over all columns
    for j = 1:n
        % If element is less than 0.5, assign value to a of 2 *
        % corresponding element from b.
        if B(i,j) < 0.5 
            A(i,j) = B(i,j) * 2;
        else
            % Otherwise assign a value of 1.
            A(i,j) = 1;
        end
    end
end

% Loop over all rows.
for i = 1:n
    % Loop over all columns.
    for j = 1:n
        % Subtract 0.001 from each element.
        A(i,j) = A(i,j) - 0.001;
        if A(i,j) < 0 
            % If element of a < 0, set to zero.
            A(i,j) = 0;
            flag = 1;
        end
    end
end

% Loop over all rows.
for i = 1:n
    % Set first column of c equal to first column of b
    C(i,1) = B(i,1);
    % Loop over columns 2 - last column.
    for j = 2:n
        % For each column, set c equal to corresponding element of b + 
        % previous column's value of c.
        C(i,j) = B(i,j) + C(i,j-1); 
    end
end

% Loop over all rows.
for i = 1:n
    % Set d = 0.
    D(i) = 0;
    % Loop over all columns.
    for j = 1:n
        % Multiply corresponding elements of a and b.
        % Then add to corresponding elements of c.
        % Then add to corresponding element of d.
        D(i) = D(i) + C(i,j) + A(i,j) * B(i,j); 
    end
end

tSlow = toc;
fprintf('Original code takes %g seconds.\n',tSlow)

%% Save original results for comparison with new results

Aslow = A;
Cslow = C;
Dslow = D;

%% Faster code

clear A C D;

tic

A = ones(2500);
isLess = B < 0.5;
A(isLess) = B(isLess) * 2;
% for i = 1:n
%     for j = 1:n
%         if B(i,j) < 0.5 
%             A(i,j) = B(i,j) * 2;
%         else
%             A(i,j) = 1;
%         end
%     end
% end

A = A - 0.001;
indices=find(A<0);
A(indices)=0;
% for i = 1:n
%     for j = 1:n
%         A(i,j) = A(i,j) - 0.001;
%         if A(i,j) < 0 
%             A(i,j) = 0;
%             flag = 1;
%         end
%     end
% end

C=cumsum(B,2);
% for i = 1:n
%     C(i,1) = B(i,1);
%     for j = 2:n
%         C(i,j) = B(i,j) + C(i,j-1); 
%     end
% end


D = sum(C + A .* B,2);
% for i = 1:n
%     D(i) = 0;
%     for j = 1:n
%         D(i) = D(i) + C(i,j) + A(i,j) * B(i,j); 
%     end
% end

fast = toc;
fprintf('Modified code takes %g seconds.\n',fast)

%% Compare results from both methods: 
% Faster is only any use if the results are correct!

sumDiffA = sum(Aslow(:) - A(:));
sumDiffC = sum(Cslow(:) - C(:));
sumDiffD = sum(Dslow(:) - D(:));
fprintf('Sum of differences between Aslow and A = %g.\n',sumDiffA)
fprintf('Sum of differences between Cslow and C = %g.\n',sumDiffC)
fprintf('Sum of differences between Dslow and D = %g.\n',sumDiffD)

speedUp = tSlow/fast;
fprintf('\nOverall code speed up factor = %g.\n',speedUp)
