function am  = AL_to_AM(al)
    [n, ~] = size(al);
    am = zeros(n);
    
    for i = 1:n
        [~, m_temp] = size(al{i});
        for j = 1:m_temp
            neighbour = al{i}(j);
            am(i, neighbour) = 1;
            am(neighbour, i) = 1;
            for k = 1:size(al{neighbour})
               if al{neighbour}(k) == i
                   al{neighbour}(k) = [];
               end
            end
       end
    end
end