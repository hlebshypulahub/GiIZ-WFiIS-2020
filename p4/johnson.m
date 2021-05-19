function D = johnson(graph)
        new_graph = add_s(graph);
        draw_directed_weighted_graph(new_graph);
        
        [new_n,~] = size(new_graph.Nodes);
        [n,~] = size(graph.Nodes);
        
        %%% przekazuję ostatni wierzchołek(s)
        [result, d] = bellman_ford(new_graph, new_n,new_n);
        
        if result == 0
            error('Istnieje cykl o ujemnej sumie wag');
        end
        %%% dzięki algorytmowi Bellmana-Forda uzyskujemy tablicę długości 
        %%% najkrótszych ścieżek od wierzchołka s: d

        %%% Długości d dla każdego wierzchołka zachowujemy w tablicy h, która posłuży do przeskalowania
        %%% wag krawędzi grafu G w taki sposób, żeby były nieujemne
        h=zeros(new_n,1);
        for v=1:new_n
            h(v) = d(v);
        end

        [size_edges_new_graph,~] = size(new_graph.Edges);
        [size_edges,~] = size(graph.Edges);

        %%% dla każdej krawędzi (u, v)
        %%% obliczamy nową wagę:
        for i=1:size_edges_new_graph
            [s,t] = findedge(new_graph,i);
            w = new_graph.Edges.Weight(i);
            new_graph.Edges.Weight(i) = w+h(s)-h(t);
        end

        
        %%% przepisanie nowych wag z grafu G' do grafu G (bez wierzchołka
        %%% S)
        for i=1:size_edges
            graph.Edges.Weight(i) = new_graph.Edges.Weight(i);
        end
        
%         draw_directed_weighted_graph(graph);
        D = zeros(n,n);

        h
        for u=1:n
            d_dijks = Dijkstra(graph,u,0)
            for v=1:n
                D(u,v) = d_dijks(v) - h(u)+h(v);
            end
        end
        D
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

        