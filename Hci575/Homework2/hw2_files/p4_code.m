StartingImage = imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\hw2_files\p4_search.png'); 
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

X = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\X.png'), 0.5); 

struct = imerode(binary, X); 
ImX = imdilate(struct, X);

[M, N, O] = size(StartingImage);
r = 255; 
g=0; 
b=0; 
for i = 1:M
    for j=1:N
        if(ImX(i,j) == 1) 
            StartingImage(i,j,1) = r; 
            StartingImage(i,j,2) = g;      
            StartingImage(i,j,3) = b;
        end
    end
end

imshow(StartingImage); 
            
            
            