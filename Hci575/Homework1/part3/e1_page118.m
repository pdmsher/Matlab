x = pi/6;
n = 5;
sum = 0; 
for k = 1:n
   sum = sum + ((-1)^(k-1)*(x^(2*k-1)/factorial(2*k-1)));  
end

check = sin(x)
sum