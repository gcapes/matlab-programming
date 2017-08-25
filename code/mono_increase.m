% mono_increase Test whether a vector is monotonically increasing
% The commented section in the conditional is required to pass the original
% tests.
% I would argue that test 3 is wrong, and the uncommented code is
% sufficient the other tests, which I agree with.
function tf = mono_increase(x)
    if isequal(sort(x),x) %&& x(1) ~= x(end) || length(x) == 1
        tf = true;
    else
        tf = false;
    end
end