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
Y = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\Y.png'), 0.5);
struct = imerode(binary, X); 
ImX = imdilate(struct, X); 
ImY = imdilate(struct, Y); 

[M, N] = size(binary); 

for i = 1:M
    for j = 1:N
        if(ImX(i, j) == 1) 
            binary(i,j) = 0; 
        end
        if(ImY(i,j) == 1)
            binary(i,j) = 1; 
        end
    end
end

imshow(~binary); 