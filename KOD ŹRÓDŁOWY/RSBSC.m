pkg load communications

m = 14; %m>3!!!! bo tabela BCH, �eby m<= 3 to trzeba troch� wi�cej rzeczy zmienia�
n = 2^m-1;
probability=0.001 %Prawdopodobie�stwo b��d�w w BSC
errornum = floor(n*probability); % to jest do ilo�ci b��d�w przy RS w BSC
errornum =3
quantity=500; % ilo�� wierszy
range = n-2; %ilo�� kolumn, to takie bo ma si� zgadza� dla tabel BCH
iteracje = 50
RS_Error_BSC_SUM = 0;


for i=1 : iteracje
bits = bitsGenerator(quantity,range); %generowanie danych

%Kodowanie RS
GFbits=gf(bits,m); %Galloi Field

RScode = rsenc(GFbits,n,columns(GFbits)); %Kodowanie Solomonem
RS_BSC = RScode + randerr(quantity,n,errornum); %zaszumianie udawane BSC
RS_BSC_result  = rsdec (RS_BSC, n, columns(bits)); %rozkodowanie BSC
RS_Error_BSC = biterr(bits,RS_BSC_result.x); %por�wnywanie BSC
RS_Error_BSC_SUM = RS_Error_BSC_SUM +RS_Error_BSC;

i++
end
DATA_SIZE = quantity * range
RS_Error_BSC_AVERAGE = RS_Error_BSC_SUM/iteracje







