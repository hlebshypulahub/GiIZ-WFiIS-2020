function im  = AM_to_IM(am)
    n = size(am);
    e = 0;
    
    for i = 2:n
        for j = 1:i
            e = e + am(i,j);
        end
    end
    %zliczamy ilość krawędzi
    
    im = zeros(n(1),e);
    id=1;
    
    for i = 2:n
        for j = i:-1:1
            if am(i,j)==1
                im(i,id)=1;
                im(j,id)=1;
                id = id+1;
            end
        end
    end
    %każdej krawędzi przypisujemy wierzchołki które łączy
end   
