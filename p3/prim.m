%%% algorytm prima

function out_g = prim(g)
%%% n - ilość wierzchołków
[n, ~] = size(g.Nodes);
%%% zbior krawędzi drzewa
out_g = graph;

W = [];
T = [];
for i = 1:n
    W(end+1) = i;
end

%%% dowolny wierzchołek startowy (tutaj: pierwszy) dodajemy
%%% do pustego drzewa T, a pozostałe wierzchołki tworzą zbiór W
W(1) = [];
T(1) = 1;

%%% wykonuj, dopóki T nie zawiera jeszcze wszystkich wierzchołków
while size(T) ~= n
    T
    interesting_edges = [];
    %%% wierzchołki z T
    for node_id = T
        %%% wierzchołki z W
        for node_2_id = W
            %%% znajdź krawędź między wierzchołkiem z T i W
            edge = findedge(g, node_id, node_2_id);
            %%% gdy istnieje, dodaj ją do zbioru interesujących nas
            %%% krawędzi
            if edge ~= 0
                interesting_edges(end+1) = edge;
            end
        end
    end

    %%% Tworzę graf tempowy na potrzeby sortowania krawędzi
    temp_g = graph;
    for i = 1:size(interesting_edges, 2)
        temp_g = addedge(temp_g, g.Edges.EndNodes(interesting_edges(i), 1), g.Edges.EndNodes(interesting_edges(i), 2), g.Edges.Weight(interesting_edges(i)));
    end

    %%% Sortuję krawędzi względnie wag
    sorted_edges_g = sortrows(temp_g.Edges, 'Weight');

    %%% Wypełniam interesting_edges na nowo
    interesting_edges = [];
    for i = 1:size(sorted_edges_g, 1)
        for j = 1:numedges(g)
            if g.Edges.EndNodes(j, 1) == sorted_edges_g.EndNodes(i, 1) && g.Edges.EndNodes(j, 2) == sorted_edges_g.EndNodes(i, 2)
                interesting_edges(end+1) = j;
            end
        end
    end

    %%% Dodaję krawędź do drzewa
    out_g = addedge(out_g, g.Edges.EndNodes(interesting_edges(1), 1), g.Edges.EndNodes(interesting_edges(1), 2), g.Edges.Weight(interesting_edges(1)));

    %%% Zapisuję wierzchołki krawędzi
    edge_nodes = g.Edges.EndNodes(interesting_edges(1), :);
  
    %%% 
    if ismember(edge_nodes(1, 1), T)
        T(end+1) = edge_nodes(1, 2);
        W = W(W~=edge_nodes(1, 2));
    else
        T(end+1) = edge_nodes(1, 1);
        W = W(W~=edge_nodes(1, 1));
    end
end
end
