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
vertical = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\vertical.png'), 0.5); 
slash =~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\slash.png'), 0.5);
plus = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\plus.png'), 0.5);
O = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\O.png'), 0.5); 
horizontal = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\horizontal.png'), 0.5);
dot = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\dot.png'), 0.5);
backslash = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\backslash.png'), 0.5);

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
        elseif(ImVert(i,j) == 1)
            StartingImage(i,j,1) = 100; 
            StartingImage(i,j,2) = 100;      
            StartingImage(i,j,3) = 0;
        elseif(ImSlash(i,j)==1)
            StartingImage(i,j,1) = 200; 
            StartingImage(i,j,2) = 0;      
            StartingImage(i,j,3) = 200;
        elseif(ImPlus(i,j)==1)
            StartingImage(i,j,1) = 100; 
            StartingImage(i,j,2) = 255;      
            StartingImage(i,j,3) = 60;
        elseif(ImO(i,j) == 1)
            StartingImage(i,j,1) = r2; 
            StartingImage(i,j,2) = g2;      
            StartingImage(i,j,3) = b2;
        elseif(ImHor(i,j)==1)
            StartingImage(i,j,1) = 0; 
            StartingImage(i,j,2) = 200;      
            StartingImage(i,j,3) = 200;
        elseif(ImDot(i,j) == 1)
            StartingImage(i,j,1) = r3; 
            StartingImage(i,j,2) = g3;      
            StartingImage(i,j,3) = b3;
        elseif(ImBack(i,j)==1)
            StartingImage(i,j,1) = 150; 
            StartingImage(i,j,2) = 100;      
            StartingImage(i,j,3) = 255;
        end
        
    end
end

imshow(StartingImage); 