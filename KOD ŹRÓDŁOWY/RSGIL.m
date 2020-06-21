pkg load communications

m = 7; %m>3!!!! bo tabela BCH, �eby m<= 3 to trzeba troch� wi�cej rzeczy zmienia�
n = 2^m-1;
pb = 1
quantity=100; % ilo�� wierszy
range = n-2; %ilo�� kolumn
iteracje = 100
RS_Error_GIL_SUM = 0;
tab = [2,3,5];


for l=1 : 3
RS_Error_GIL_SUM = 0;
pg = 100/(pb*10^tab(l))

for i=1 : iteracje
bits = bitsGenerator(quantity,range); %generowanie danych

%Kodowanie RS

GFbits=gf(bits,m); %Galloi Field
RScode = rsenc(GFbits,n,columns(GFbits)); %Kodowanie Solomonem
RS_Gilbert = Gilbert(RScode, pg,pb); %gilbert
RS_Gilbert_result = rsdec (RS_Gilbert, n, columns(bits)); %rozkodowanie Gilbertem
RS_Error_GIL = biterr(bits,RS_Gilbert_result.x); %por�wnianie Gilberta
RS_Error_GIL_SUM = RS_Error_GIL_SUM +RS_Error_GIL;
i++
end

DATA_SIZE = quantity * range
RS_Error_GIL_AVERAGE = RS_Error_GIL_SUM/iteracje
l++
end