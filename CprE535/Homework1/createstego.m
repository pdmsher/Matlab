function stego = createstego(cover, payload, length) 
stego = cover(:,:);
b1 = double(bitget(stego, 1));
[M, N]=size(stego); 
count = 1;
change = 0; 
[payRow,payCol] = size(payload);  

for i=1:M 
    for j=1:N
          if count == payCol +1
             break; 
          end
          if b1(i,j) ~= payload(1,count)
            if payload(1, count) == 1 
               stego(i, j) = stego(i,j) + 1; 
            end
            if payload(1, count) == 0 
               stego(i, j) = stego(i,j) - 1; 
            end
            change = change + 1; 
          end
          count = count + 1;
    end
    if count == payCol +1
        break; 
    end
end






 
