%%% Konwertuje ciąg graficzny na macierz sąsiedztwa
function al = DS_to_AL(ds)
    if is_degree_seq(ds)
        %%% n = ilość wierzchołków
        [~, n] = size(ds);
        
        %%% To jest numery wierzchołków od 1 do n
        key_set = (1:n);
        
        %%% Mapa [key(numer wierzchołka) -> value(stopień)]
        map = containers.Map(key_set, ds);

        %%% Makieta listy
        al = cell(n, 1);
        
        %%% Pobieram keys and values dla sortowania
        keys = map.keys;
        values = map.values;
        %%% Sortuje według values z zachowaniem pozycji
        [sorted_values, sort_idx] = sort([values{:}], 'descend');
        %%% Tworzy nowe keys na podstawie pozycji values
        sorted_keys = keys(sort_idx);

        for dummy = 1:n
            %%% Aktualizuje mapę
            map = containers.Map(sorted_keys, sorted_values);
            %%% Sortuje
            keys = map.keys;
            values = map.values;
            [sorted_values, sort_idx] = sort([values{:}], 'descend');
            sorted_keys = keys(sort_idx);
            
            j = 2;
            
            
            while sorted_values(1) > 0  
                al{sorted_keys{1}}(end + 1) = sorted_keys{j};
                al{sorted_keys{j}}(end + 1) = sorted_keys{1};
                sorted_values(1) = sorted_values(1) - 1;
                sorted_values(j) = sorted_values(j) - 1;
                j = j + 1;
            end
        end
    end
end