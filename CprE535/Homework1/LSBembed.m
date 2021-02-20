Cover=imread('C:\Users\Peyton\Documents\MATLAB\CprE535\Homework1\cover\cover01.png');
[M, N] = size(Cover);
K=.25*M*N; 
cap = ceil(log2(M*N)); 
payload = round(rand(1, K)); 
len = dec2bin(K, cap); 

stego=createstego(Cover, payload, len); 
Xpayload = LSBextract(stego, K); 
results = 'empty';
% for i=1:K
%     if Xpayload(1,i) ~= payload(1,i)
%         results = 'false';
%     end
% end
if xor(payload,Xpayload) == 0
    i = 1
end

b1 = bitget(Cover, 1); 
b2 = bitget(stego, 1); 
b3 = abs(b1 - b2); 
imshow(b3); 
% if strcmp(results, 'empty')
%     results = 'true';
% end