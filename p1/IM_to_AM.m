function am  = IM_to_AM(im)
    n = size(im);
    e = 0;
    
    am = zeros(n(1),n(1));
     
    for j = 1:n(2)
        idx = [-1,-1];
        for i = 1:n(1)
            if im(i,j)==1
                if idx(1)== -1
                   idx(1)=i;
                else
                    am(idx(1),i)=1;
                    am(i,idx(1))=1;
                    break
                end
                %znajdujemy indeksy wierzchołków które łączy krawędż i wpisujemy w odpowiednie miejsce AM indeksy
            end
        end
    end
end
