function X=tripleDecode(data)
    Y=data;
    for i = 1 : rows(Y)
        for j= 1: columns(Y)/3
          zero=0; 
              for k=0:2
                if Y(i,3*j-k)==0 zero++; 
                end
              end

            if (zero>1) X(i,j)=0; end
            if (zero<2) X(i,j)=1; end 
        end
    end