% mono_increase_test Test suite for mono_increase
% I dispute test 3

% Test 1	
x = [0 1 2 3 4];
assert(isequal(mono_increase(x),true));

% Test 2
x = [0];
assert(isequal(mono_increase(x),true));

% Test 3
x = [0 0 0 0 0];
% I think this assertion is wrong i.e. the vector is monotonic.
% If test 2 is true, then test 3 should also be.
% https://en.wikipedia.org/wiki/Monotonic_function
assert(isequal(mono_increase(x),false));

% Test 4
x = [0 1 2 3 -4];
assert(isequal(mono_increase(x),false));

% Test 5
x = [-3 -4 2 3 4];
assert(isequal(mono_increase(x),false));

% Test 6
x = 1:.1:10;
assert(isequal(mono_increase(x),true));

% Test 7
x = cumsum(rand(1,100));
x(5) = -1;
assert(isequal(mono_increase(x),false));

% Test 8
x = cumsum(rand(1,50));
assert(isequal(mono_increase(x),true)); 