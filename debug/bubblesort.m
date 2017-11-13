% BUBBLESORT A demo function to sort an array
% Contains an error for learners to find using the debugger
% Example usage:
% sortedA = bubblesort(rand(100,1));
% Stolen shamelessly from https://blogs.mathworks.com/community/2008/12/15/visual-debugging-with-linked-plots/
function A = bubblesort(A)

    for i = length(A)-1:-1:1
        for j = 2:i
            if A(j-1) > A(j)
                temp = A(j-1);
                A(j-1) = A(j);
                A(j) = temp;
            end
        end
    end
end