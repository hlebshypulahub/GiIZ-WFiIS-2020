function johnson(graph)
        new_graph = add_s(graph);
        draw_directed_weighted_graph(new_graph);
        
        [n,~] = size(new_graph.Nodes);
        
        %%% przekazuję ostatni wierzchołek(s)
        [result, d] = bellman_ford(new_graph, n);
        
        if result == 0
            error('Istnieje cykl o ujemnej sumie wag');
        end
        
        %%% dzięki algorytmowi Bellmana-Forda uzyskujemy tablicę długości 
        %%% najkrótszych ścieżek od wierzchołka s: d

        d

end

%%% wierzchołek o największym numerze to wierzchołek S
function new_graph = add_s(g)
        new_graph = g;
        [n,~] = size(new_graph.Nodes);
        new_graph = addnode(new_graph,1);
        
        for i = 1:n
            new_graph = addedge(new_graph, n+1, i, 0); %%% dodaję krawędź między wierzchołkiem i a ostatnim(s)
        end
end

        