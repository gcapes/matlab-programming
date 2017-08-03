% bubblesort A demo function to sort an array
% Contains an error for learners to find using the debugger
% Example usage:
% sortedA = bubblesort(rand(100,1));
% Stolen shamelessly from https://blogs.mathworks.com/community/2008/12/15/visual-debugging-with-linked-plots/
function A = bubblesort(A)
    
    % Loop over all elements in vector A, from last to first.
    % This is where the bug was: an off-by-one error converting from C
    % (zero-based array indexing) to MATLAB (one-based array indexing).
    for i = length(A):-1:1
        % For each iteration, loop again over all elements.
        for j = 2:i
            % Compare neighbouring elements.
            if A(j-1) > A(j)
                % If the previous element is greater than the current one,
                % swap their values using a temporary variable.
                temp = A(j-1);
                A(j-1) = A(j);
                A(j) = temp;
            end
        end
    end
end