function Y = Gilbert(data,pg,pb)
    Y=data;
    state=true;
    for i = 1 : rows(Y)
        for j= 1: columns(Y)
            p=randi([0,1000000]);
            
              if (((state==true) && (p<pg*10000)) || ((state==false) && (p<pb*10000)))
                  state=~state;
             end
             
             c=randi([0,100000]);
             
             if (state==false) 
                if (c<70000) Y(i,j)=~Y(i,j); 
                  end
               end
               
             if (state==true) 
                  if (c<1) Y(i,j)=~Y(i,j); 
                  end
              end
             
             
        end
    end
endfunction