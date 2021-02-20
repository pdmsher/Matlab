X=[1,2,3;3,3,4;2,3,3]; 
sol = X\[1;1;2];

Y = [1,2,3,1;3,3,4,1;2,3,3,2]; 
sol2=rref(Y); 

[L,U] = lu(X); 

%I wasn't quite sure how to do the LU decomp, I was looking into it but
%didn't quite understand how it worked on matlab. 