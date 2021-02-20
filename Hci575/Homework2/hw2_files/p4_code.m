StartingImage = imread('C:\Users\Peyton\Documents\MATLAB\Hci575\Homework2\hw2_files\p1_search.png'); 
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

X = ~im2bw(imread('C:\Users\Peyton\Documents\MATLAB\Hci575\Homework2\Symbol_Cutouts\X.png'), 0.5); 

struct = imerode(binary, X); 
ImX = imdilate(struct, X);
