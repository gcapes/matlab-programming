clear all
n = 2500;
B = rand(n);

for i = 1:n
    for j = 1:n
        if B(i,j) < 0.5 
            A(i,j) = B(i,j) * 2;
        else
            A(i,j) = 1;
        end
    end
end

for i = 1:n
    for j = 1:n
        A(i,j) = A(i,j) - 0.001;
        if A(i,j) < 0 
            A(i,j) = 0;
            flag = 1;
        end
    end
end

for i = 1:n
    C(i,1) = B(i,1);
    for j = 2:n
        C(i,j) = B(i,j) + C(i,j-1); 
    end
end

for i = 1:n
    D(i) = 0;
    for j = 1:n
        D(i) = D(i) + C(i,j) + A(i,j) * B(i,j); 
    end
end
