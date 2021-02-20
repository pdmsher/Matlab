function Xpayload= LSBextract(stego, payLength)
b1 = bitget(stego, 1);
b1=b1';
Xpayload = b1(1:payLength); 
