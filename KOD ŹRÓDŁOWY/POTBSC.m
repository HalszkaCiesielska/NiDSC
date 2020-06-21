pkg load communications


probability=0.01 %Prawdopodobieñstwo b³êdów w BSC
quantity=1000 % iloœæ wierszy
range = 1000 % iloœæ kolumn

iteracje = 20
Triple_Error_BSC_SUM = 0;
tab = [2,3,5];


for l=2 : 3
Triple_Error_BSC_SUM = 0;
probability = 10^(-tab(l))

for i=1 : iteracje
bits = bitsGenerator(quantity,range); %generowanie danych

%kod potrojeniowy
Triple=tripleCode(bits); %kodowanie potrojeniowym

Triple_BSCChannel = bsc(Triple, probability); %Zaszumianie BSC
Triple_BSCResult=tripleDecode(Triple_BSCChannel); % Dekodowanie potrojeniowym
Triple_Error_BSC = biterr(bits,Triple_BSCResult); %porównywanie BSC
Triple_Error_BSC_SUM = Triple_Error_BSC_SUM + Triple_Error_BSC;


i++
end

DATA_SIZE = quantity * range
Triple_Error_BSC_AVERAGE = Triple_Error_BSC_SUM/iteracje
l++
end
