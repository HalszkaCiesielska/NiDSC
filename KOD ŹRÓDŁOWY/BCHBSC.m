pkg load communications

m = 12;
n = 2^m-1;
probability=0.00001 %Prawdopodobieñstwo b³êdów w BSC
t=4;
quantity=300; % iloœæ wierszy
range = n-t*m; %iloœæ kolumn, to takie bo ma siê zgadzaæ dla tabel BCH

iteracje = 50

BCH_Error_BSC_SUM = 0;


for i=1 : iteracje
bits = bitsGenerator(quantity,range); %generowanie danych



%Kod BCH
BCHcode=bchenco(bits,n,range); %kodowanie BCH

BCH_BSCChannel = bsc(BCHcode, probability); %Zaszumianie BSC
BCH_BSCResult=bchdeco(BCH_BSCChannel,range,t); %dekodowanie BSC
BCH_Error_BSC = biterr(bits,BCH_BSCResult); %porównywanie BSC
BCH_Error_BSC_SUM = BCH_Error_BSC_SUM + BCH_Error_BSC;

i++
end

DATA_SIZE = quantity * range

BCH_Error_BSC_AVERAGE = BCH_Error_BSC_SUM/iteracje


