pkg load communications

pb = 1 %prawdopodobie�stwo przej�cia ze z�oge na dobry stanu

quantity=125 % ilo�� wierszy
range = 100 %ilo�� kolumn
iteracje = 100
tab = [2,3,5];
Triple_Error_GIL_SUM = 0;

for l=1 : 3
Triple_Error_GIL_SUM = 0;
pg = 100/(pb*10^tab(l))

for i=1 : iteracje
bits = bitsGenerator(quantity,range); %generowanie danych

%kod potrojeniowy
Triple=tripleCode(bits); %kodowanie potrojeniowym

Triple_GilbertChannel=Gilbert(Triple,pg,pb); %Zaszumianie Gilbertem
Triple_GilbertResult=tripleDecode(Triple_GilbertChannel); %Dekodowanie potrojeniowym
Triple_Error_GIL = biterr(bits,Triple_GilbertResult); %por�wnianie Gilberta
Triple_Error_GIL_SUM = Triple_Error_GIL_SUM + Triple_Error_GIL;
i++
end

DATA_SIZE = quantity * range
Triple_Error_GIL_AVERAGE = Triple_Error_GIL_SUM/iteracje
l++
end