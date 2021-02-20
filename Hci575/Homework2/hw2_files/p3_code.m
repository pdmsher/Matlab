StartingImage = imread('C:\Users\Peyton\Documents\MATLAB\Hci575\Homework2\hw2_files\p3_search.png'); 
binary = ~im2bw(StartingImage, 0.5);

Struct = imread('C:\Users\Peyton\Documents\MATLAB\Hci575\Homework2\Symbol_Cutouts\square2.png');
s = ~im2bw(Struct, .5); 

e = imerode(binary, s); 


[M, N] = size(binary); 
last = 0; 
for i = 1:M
    for j = 1:N
        if(e(i, j) == 1) 
            r = 255 * rand(1, 1); 
            g = 255 * rand(1, 1); 
            b = 255 * rand(1, 1);  
            for k=i-10:i+10
                for l=j-10:j+10
                    StartingImage(k,l,1) = r; 
                    StartingImage(k,l,2) = g;
                    StartingImage(k,l,3) = b;
                end
            end
        end
    end
end



%e = imdilate(e, s); 
% e = imdilate(e, structure); 
% e = imdilate(e, structure); 
% 
% imshow(e);
 figure; imshow(StartingImage); 