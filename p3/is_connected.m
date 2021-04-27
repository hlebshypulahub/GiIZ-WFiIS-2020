%%% Sprawdza czy graf jest spójny
function out = is_connected(g)
    %%% nr spójnej składowej
    nr = 0;
    
    al = AM_to_AL(full(adjacency(g)));
    n = size(al, 1);
    
    %%% 1 kolumna to numery wierzchołków
    %%% 2 kolumna to ilość odwiedzeń (na początku -1)
    comp = ones(1, n).' * -1;
    
    for i = 1:n
        if comp(i) == -1
            nr = nr + 1;
            comp(i) = nr;
            comp = components_r(nr, i, comp, al);
        end
    end

    out = size(unique(comp), 1) == 1;
end