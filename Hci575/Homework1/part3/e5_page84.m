G = [2,6,0,0,0,0;3,9,0,0,0,0;0,0,1,2,0,0;0,0,3,4,0,0;0,0,0,0,-5,5;0,0,0,0,5,3]; 


A=G; 
B=G; 
C=G; 
A(:,end)=[];
A(end,:)=[];

B=B(1:4,1:4); 

C(5,5)=4;

%D: What happens when we type G(13)?
%Ans: WE get the 13th element in the matrix, which is at position g(1,3)
%which is zero
%E: What happens when we type G(12,1) = 1?
%Ans: It changes the size of our array to accomidate the newly added 1. 