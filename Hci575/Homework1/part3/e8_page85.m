A = rand(10); 
A = 100*A; 
A = fix(A); 
count = 1; 

for i = 1:10
    for j = 1:10
        if A(i,j) < 10
            A(i,j) = 0; 
        end
        if A(i,j) > 90
            A(i,j) = inf; 
        end
        if (A(i,j) > 30) && (A(i,j) < 50)
            b(count) = A(i,j); 
            count = count + 1;
        end
    end
end