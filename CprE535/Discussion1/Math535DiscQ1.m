%-----Setup/Reading in Initial Image-----%
Im = imread('Ondra_sampling.jpg'); 
red = Im(:, :, 1); 
green = Im(:, :, 2); 
blue = Im(:, :, 3); 


blk = zeros(size(Im, 1), size(Im, 2), 'uint8'); 
r = cat(3, red, blk, blk); 
g = cat(3, blk, green, blk);
b = cat(3, blk, blk, blue);

%-----Display in seperate windows-----%

% reIm = cat(3, red, green, blue); 
 imshow(Im); 
% figure, imshow(r); 
% figure, imshow(g); 
% figure, imshow(b); 


%-----All in one image-----%

% imshow(Im); 
% subplot(2, 2, 2); 
% imshow(r); 
% subplot(2, 2, 3); 
% imshow(g); 
% subplot(2, 2, 4); 
% imshow(b); 

%-----GrayScaling image and displaying-----%

% grayScale = rgb2gray(Im); 
% subplot(3, 3, 1); 
% imshow(grayScale); 

%-----Display All bitfields next to each other-----%

% b1 = double(bitget(grayScale, 1));
% subplot(3, 3, 2); 
% imshow(b1); 
% b2 = double(bitget(grayScale, 2)); 
% subplot(3, 3, 3); 
% imshow(b2); 
% b3 = double(bitget(grayScale, 3)); 
% subplot(3, 3, 4); 
% imshow(b3); 
% b4 = double(bitget(grayScale, 4));
% subplot(3, 3, 5);
% imshow(b4); 
% b5 = double(bitget(grayScale, 5));
% subplot(3, 3, 6);
% imshow(b5); 
% b6 = double(bitget(grayScale, 6)); 
% subplot(3, 3, 7);
% imshow(b6); 
% b7 = double(bitget(grayScale, 7));
% subplot(3, 3, 8);
% imshow(b7); 
% b8 = double(bitget(grayScale, 8)); 
% subplot(3, 3, 9);
% imshow(b8); 

%----- Image Profiling -----%

%subplot(1, 1, 1);
%improfile(Im, [460, 140], [872, 457]); 




