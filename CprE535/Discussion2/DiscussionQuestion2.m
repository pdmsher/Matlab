Im = imread('Ondra_sampling.jpg'); 
Im = rgb2gray(Im); 
[M, N] = size(Im);
K = M *N; 
BitLayer = bitget(Im, 1); 
payload = round(rand(1, K));
BitDifference = 0; 
temp = 1; 
for i = 1:M
    for j = 1:N 
        if BitLayer(i,j)~= payload(1, temp)
            BitDifference = BitDifference + 1;  
        end
        temp = temp + 1; 
    end
end 

ChangeRate = BitDifference / (M * N);
embEff = 1/ChangeRate 
