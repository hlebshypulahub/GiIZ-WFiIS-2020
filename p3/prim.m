%%% algorytm prima

function out_g = prim(g)
%%% n - ilość wierzchołków
[n, ~] = size(g.Nodes);
%%% zbior krawędzi drzewa
out_g = graph;

%%% wierzchołki grafu dzielimy na dwie części
W = [];
T = [];
for i = 1:n
    W(end+1) = i;
end

%%% dowolny wierzchołek startowy dodajemy
%%% do pustego drzewa T, a pozostałe wierzchołki tworzą zbiór W
W(1) = [];
T(1) = 1;

%%% wykonuj, dopóki T nie zawiera jeszcze wszystkich wierzchołków
while size(T) ~= n
    
    temp_edges = [];
    %%% W każdym kroku analizujemy tylko krawędzie łączące T z W
    
    %%% wierzchołki z T
    for node1 = T
        %%% wierzchołki z W
        for node2 = W
            %%% znajdź krawędź między wierzchołkiem z T i W
            edge = findedge(g, node1, node2);
            %%% gdy istnieje, dodaj ją do zbioru 
            %%% interesujących nas krawędzi
            if edge ~= 0
                temp_edges(end+1) = edge;
            end
        end
    end

    %%% Tworzę graf tempowy na potrzeby sortowania krawędzi
    temp_g = graph;
    for i = 1:size(temp_edges, 2)
        temp_g = addedge(temp_g, g.Edges.EndNodes(temp_edges(i), 1), g.Edges.EndNodes(temp_edges(i), 2), g.Edges.Weight(temp_edges(i)));
    end

    %%% Sortuję krawędzie względem wag
    sorted_edges_g = sortrows(temp_g.Edges, 'Weight');

    %%% Wypełniam temp_edges na nowo
    temp_edges = [];
    for i = 1:size(sorted_edges_g, 1)
        for j = 1:numedges(g)
            if g.Edges.EndNodes(j, 1) == sorted_edges_g.EndNodes(i, 1) && g.Edges.EndNodes(j, 2) == sorted_edges_g.EndNodes(i, 2)
                temp_edges(end+1) = j;
            end
        end
    end

    %%% Dodaję krawędź do drzewa
    out_g = addedge(out_g, g.Edges.EndNodes(temp_edges(1), 1), g.Edges.EndNodes(temp_edges(1), 2), g.Edges.Weight(temp_edges(1)));

    %%% Zapisuję wierzchołki krawędzi
    edge_nodes = g.Edges.EndNodes(temp_edges(1), :);
  
    %%% Dodajemy wierzchołki do drzewa T, jednocześnie usuwając odpowiedni wierzchołek z W
    if ismember(edge_nodes(1, 1), T)
        T(end+1) = edge_nodes(1, 2);
        W = W(W~=edge_nodes(1, 2));
    else
        T(end+1) = edge_nodes(1, 1);
        W = W(W~=edge_nodes(1, 1));
    end
end
end