function y = e2_page118(x,n)
for k = 1:n
   y = y + ((-1)^(k-1)*(x^(2*k-1)/factorial(2*k-1)));  
end
