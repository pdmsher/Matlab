 StartingImage = imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\hw2_files\p1_search.png'); 
binary = ~im2bw(StartingImage, 0.5); 
hostruct = strel('line', 40, 0); 
verstruct = strel('line', 40, 90);
ho = imerode(binary, hostruct);
ho= imdilate(ho, hostruct); 
ver=imerode(binary, verstruct); 
ver=imerode(ver, verstruct); 
ver=imdilate(ver, verstruct);
ver=imdilate(ver, verstruct);
EndImageBorder= ho + ver;

%Find X's
X = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\X.png'), 0.5); 
struct = imerode(binary, X); 
ImX = imdilate(struct, X);

O = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\O.png'), 0.5);
struct = imerode(binary, O); 
ImO = imdilate(struct, O);

dot = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\dot.png'), 0.5);
struct = imerode(binary, dot); 
ImDot = imdilate(struct, dot);

[M, N, O] = size(StartingImage);
r1 = 255; 
g1=0; 
b1=0;
r2 = 0; 
g2=255; 
b2=0; 
r3 = 0; 
g3=0; 
b3=255;
for i = 1:M
    for j=1:N
        if(ImX(i,j) == 1) 
            StartingImage(i,j,1) = r1; 
            StartingImage(i,j,2) = g1;      
            StartingImage(i,j,3) = b1;
        elseif(ImO(i,j) == 1)
            StartingImage(i,j,1) = r2; 
            StartingImage(i,j,2) = g2;      
            StartingImage(i,j,3) = b2;
        elseif(ImDot(i,j) == 1)
            StartingImage(i,j,1) = r3; 
            StartingImage(i,j,2) = g3;      
            StartingImage(i,j,3) = b3;
        end
        
    end
end

imshow(StartingImage); 