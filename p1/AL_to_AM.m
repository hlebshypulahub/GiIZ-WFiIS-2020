function am  = AL_to_AM(al)
    [n, ~] = size(al);
    am = zeros(n);
    
    m = 0;
    for i = 1:n
        [~, m_temp] = size(al{i});
        m = m + m_temp;
    end
    %%% Sprawdzamy, że suma stopni jest parzysta
    if mod(m, 2) == 1
        error('Invalid adjacency list - sum of vertices degrees is not even.');
    end
    
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