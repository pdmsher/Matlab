Coverimages = dir('C:\Users\Peyton\Documents\MATLAB\CprE535\Homework2\cover\*.png'); 
Stegoimages = dir('C:\Users\Peyton\Documents\MATLAB\CprE535\Homework2\stego\*.jpeg'); 
cnt = (1:50); 
change = 0; 
changes = zeros(1,50); 
for i = 1:length(images)
    imName = images(i).name;
    Cover=imread(['C:\Users\Peyton\Documents\MATLAB\CprE535\Homework1\cover\' imName]);
    [M, N] = size(Cover);
    K=.25*M*N; 
    cap = ceil(log2(M*N)); 
    payload = round(rand(1, K)); 
    len = dec2bin(K, cap); 
    stego=createstego(Cover, payload, len); 
    Xpayload = LSBextract(stego, K); 
    for j=1:M
        for k=1:N
            if  Cover(j,k) ~= stego(j,k)
            change = change + 1; 
            end 
        end
    end
    changes(1,i) = change/(512 * 512); 
    change = 0; 
    imwrite(stego, ['C:\Users\Peyton\Documents\MATLAB\CprE535\Homework1\stego\' num2str(cnt(1, i),'%d') '.jpeg' ]);  
end
