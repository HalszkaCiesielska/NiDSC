pkg load communications

m = 7;
n = 2^m-1;
t=12;
quantity=100; % iloœæ wierszy
range = n-t*m; %iloœæ kolumn, to takie bo ma siê zgadzaæ dla tabel BCH
pb = 1 
pg = 100/(pb*10^5)
iteracje = 50

BCH_Error_GIL_SUM = 0;


for i=1 : iteracje
bits = bitsGenerator(quantity,range); %generowanie danych



%Kod BCH
BCHcode=bchenco(bits,n,range); %kodowanie BCH

BCH_GilbertChannel=Gilbert(BCHcode,pg,pb); %dekodowanie BSC
BCH_GilbertResult=bchdeco(BCH_GilbertChannel,range,t); %dekodowanie gilbertem
BCH_Error_GIL = biterr(bits,BCH_GilbertResult); %porównianie Gilberta
BCH_Error_GIL_SUM = BCH_Error_GIL_SUM + BCH_Error_GIL;

i++
end

DATA_SIZE = quantity * range

BCH_Error_GIL_AVERAGE = BCH_Error_GIL_SUM/iteracje


