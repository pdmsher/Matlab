%I realized after I did all this that after I did the first part I could've
%just subtracted the first from the second and it would've been the same. 
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


figure; imshow(EndImageBorder); 

X = ~im2bw(imread('C:\Users\Peyton\Documents\MATLAB\Hci575\Homework2\Symbol_Cutouts\X.png'), 0.5); 
vertical = ~im2bw(imread('C:\Users\Peyton\Documents\MATLAB\Hci575\Homework2\Symbol_Cutouts\vertical.png'), 0.5); 
slash =~im2bw(imread('C:\Users\Peyton\Documents\MATLAB\Hci575\Homework2\Symbol_Cutouts\slash.png'), 0.5);
plus = ~im2bw(imread('C:\Users\Peyton\Documents\MATLAB\Hci575\Homework2\Symbol_Cutouts\plus.png'), 0.5);
O = ~im2bw(imread('C:\Users\Peyton\Documents\MATLAB\Hci575\Homework2\Symbol_Cutouts\O.png'), 0.5); 
horizontal = ~im2bw(imread('C:\Users\Peyton\Documents\MATLAB\Hci575\Homework2\Symbol_Cutouts\horizontal.png'), 0.5);
dot = ~im2bw(imread('C:\Users\Peyton\Documents\MATLAB\Hci575\Homework2\Symbol_Cutouts\dot.png'), 0.5);
backslash = ~im2bw(imread('C:\Users\Peyton\Documents\MATLAB\Hci575\Homework2\Symbol_Cutouts\backslash.png'), 0.5);

struct = imerode(binary, X); 
ImX = imdilate(struct, X);

struct = imerode(binary, vertical); 
struct2 = strel('line', 50, 90); 
struct = imerode(struct, struct2); 
ImVert = imdilate(struct, struct2);
ImVert = imdilate(ImVert, vertical); 
struct = imerode(binary, vertical); 
ImVert2 = imdilate(struct, vertical);
ImVert = ImVert2 - ImVert; 


struct = imerode(binary, slash); 
ImSlash = imdilate(struct, slash);

struct = imerode(binary, plus); 
ImPlus = imdilate(struct, plus);
ImPlus = ImPlus - EndImageBorder; 

struct = imerode(binary, O); 
ImO = imdilate(struct, O);

struct = imerode(binary, horizontal); 
struct2 = strel('line', 50, 0); 
struct = imerode(struct, struct2); 
ImHor = imdilate(struct, struct2);
ImHor = imdilate(ImHor, horizontal); 
struct = imerode(binary, horizontal); 
ImHor2 = imdilate(struct, horizontal);
ImHor = ImHor2 - ImHor; 

struct = imerode(binary, dot); 
ImDot = imdilate(struct, dot);

struct = imerode(binary, backslash); 
ImBack = imdilate(struct, backslash);


result = ImX + ImVert + ImSlash  + ImO + ImHor + ImDot+ ImBack + ImPlus; 
figure; imshow(result); 

