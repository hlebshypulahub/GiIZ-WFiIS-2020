%%% Zamienia krawędzi ab i cd na ad i bc ranpomowo k razy
function g_out = rand_graph(g_in, k)
    %%% Dostajemy macierz incydencji
    am = full(adjacency(g_in));
    al = AM_to_AL(am);
    im = AL_to_IM(al);
    
    %%% Rozmiary
    [n, m] = size(im);
     
    %%% Liczy iteracje
    count = 0;

    while k > 0 && count < k + 100        
        %%% Losowo wybieram 2 różne krawędzi
        edges = randperm(m, 2);
    
        %%% Znajduje pozycje jedynek na tych krawędziach
        edge_1_ones = find(im(:, edges(1)));
        edge_2_ones = find(im(:, edges(2)));

        %%% Jeśli do tych krawędzi należą 4 RÓŻNE wierzchołki
        if size(unique([edge_1_ones; edge_2_ones]), 1) == 4
            %%% Tworzy 2 nowe krawędzi
            new_edge_1 = zeros(n, 1);
            new_edge_2 = zeros(n, 1);
    
            %%% Wypełnia jedynkami na zasadzie ab cd -> ad bc
            new_edge_1(edge_1_ones(1)) = 1;
            new_edge_1(edge_2_ones(2)) = 1;
            new_edge_2(edge_1_ones(2)) = 1;
            new_edge_2(edge_2_ones(1)) = 1;
            
            %%% Jeśli te nowe krawędzi nie istnieją na grafie,
            %%% to wstawiam je zamiast tych starych
            if ~(any(ismember(im.', new_edge_1.', 'rows') == 1)...
                    || any(ismember(im.', new_edge_2.', 'rows') == 1))
                im(:, edges(1)) = new_edge_1;
                im(:, edges(2)) = new_edge_2;
                k = k - 1;
            end
        end
        
        count = count + 1;
    end
    
    al = IM_to_AL(im);
    am = AL_to_AM(al);
    
    g_out = graph(am);
end