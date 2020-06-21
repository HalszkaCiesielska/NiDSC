function Y = tripleCode(data) 
  X=data;
    for i = 1 : rows(X)
        for j= 1: columns(X)
          Y(i,3*j-2)=Y(i,3*j-1)=Y(i,3*j)=X(i,j);
        end
    end