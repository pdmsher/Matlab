StartingImage = imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\hw2_files\p8_search.png'); 
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


vertical = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\vertical.png'), 0.5); 
slash =~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\slash.png'), 0.5);
plus = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\plus.png'), 0.5);
O = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\O.png'), 0.5); 
horizontal = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\horizontal.png'), 0.5);
dot = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\dot.png'), 0.5);
backslash = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\backslash.png'), 0.5);


X = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\X.png'), 0.5); 
Y = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\Y.png'), 0.5);
A = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\A.png'), 0.5); 
B = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\B.png'), 0.5); 
C = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\C.png'), 0.5); 
D = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\D.png'), 0.5); 
E = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\E.png'), 0.5); 
F = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\F.png'), 0.5); 
Q = ~im2bw(imread('C:\Users\psher\OneDrive\Documents\Matlab2\Matlab\Hci575\Homework2\Symbol_Cutouts\Q.png'), 0.5); 

struct = imerode(binary, X); 
ImX = imdilate(struct, X); 
ImY = imdilate(struct, Y); 

struct = imerode(binary, plus); 
ImPlus = imdilate(struct, plus);
ImPlus = ImPlus - EndImageBorder; 
ImPlus = max(ImPlus, 0);
ImPlus2 = imerode(ImPlus, plus); 
ImC = imdilate(ImPlus2, C); 

struct = imerode(binary, vertical); 
struct2 = strel('line', 50, 90); 
struct = imerode(struct, struct2); 
ImVert = imdilate(struct, struct2);
ImVert = imdilate(ImVert, vertical); 
struct = imerode(binary, vertical); 
ImVert2 = imdilate(struct, vertical);
ImVert = ImVert2 - ImVert;
ImVert2 = imerode(ImVert, vertical); 
ImA = imdilate(ImVert2, A); 


struct = imerode(binary, slash); 
ImSlash = imdilate(struct, slash);
ImB = imdilate(struct, B); 



struct = imerode(binary, O); 
ImO = imdilate(struct, O);
ImQ = imdilate(struct, Q); 

bi = binary - ImPlus; 

struct = imerode(binary, horizontal); 
struct2 = strel('line', 50, 0); 
struct = imerode(struct, struct2); 
ImHor = imdilate(struct, struct2);
ImHor = imdilate(ImHor, horizontal);
bi = bi - ImHor; 

struct = imerode(bi, horizontal); 
ImHor = imdilate(struct, horizontal);
ImD = imdilate(struct, D); 


struct = imerode(binary, dot); 
ImDot = imdilate(struct, dot);
ImE = imdilate(struct, E); 

struct = imerode(binary, backslash); 
ImBack = imdilate(struct, backslash);
ImF = imdilate(struct, F); 

[M, N] = size(binary); 

for i = 1:M
    for j = 1:N
        if(ImX(i, j) == 1) 
            binary(i,j) = 0; 
        end
        if(ImY(i,j) == 1)
            binary(i,j) = 1; 
        end
        if(ImVert(i, j) == 1) 
            binary(i,j) = 0; 
        end
        if(ImA(i,j) == 1)
            binary(i,j) = 1; 
        end  
        if(ImSlash(i, j) == 1) 
            binary(i,j) = 0; 
        end
        if(ImB(i,j) == 1)
            binary(i,j) = 1; 
        end
        if(ImPlus(i, j) == 1) 
            binary(i,j) = 0; 
        end
        if(ImC(i,j) == 1)
            binary(i,j) = 1; 
        end
        if(ImHor(i, j) == 1) 
            binary(i,j) = 0; 
        end
        if(ImD(i,j) == 1)
            binary(i,j) = 1; 
        end
        if(ImDot(i, j) == 1) 
            binary(i,j) = 0; 
        end
        if(ImE(i,j) == 1)
            binary(i,j) = 1; 
        end
        if(ImBack(i, j) == 1) 
            binary(i,j) = 0; 
        end
        if(ImF(i,j) == 1)
            binary(i,j) = 1; 
        end
        if(ImO(i, j) == 1) 
            binary(i,j) = 0; 
        end
        if(ImQ(i,j) == 1)
            binary(i,j) = 1; 
        end
    end
end
imshow(StartingImage); 
figure; 
imshow(~binary); 