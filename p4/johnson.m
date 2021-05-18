function johnson(graph)
        new_graph = add_s(graph);
        draw_directed_weighted_graph(new_graph);
        
        [n,~] = size(new_graph.Nodes);
     
        %%% przekazuję ostatni wierzchołek(s)
        [result, d] = bellman_ford(new_graph, n,n);
        
        if result == 0
            error('Istnieje cykl o ujemnej sumie wag');
        end
        
        %%% dzięki algorytmowi Bellmana-Forda uzyskujemy tablicę długości 
        %%% najkrótszych ścieżek od wierzchołka s: d

%         d
        
        h=zeros(n,1);
        for v=1:n
            h(v) = d(v);
        end
%         h

        [size_edges,~] = size(new_graph.Edges);

        for i=1:size_edges
%             new_graph.Edges.Weight(i) = 
        end
%         for edge in new_graph.get_edges():
%             nodes = edge.get_nodes_ids()
%             u = nodes[0].get_id()
%             v = nodes[1].get_id()
%             w = edge.get_weight()
%             edge.set_weight(w + h[u] - h[v])
% 
%         cls.copy_weights(new_graph, graph)
% 
%         D = [[0 for x in range(len(graph.get_nodes()))] for y in range(len(graph.get_nodes()))]
%         old_nodes = [i.get_id() for i in graph.get_nodes()]
%         for u in old_nodes:
%             for v in old_nodes:
%                 dist, path = cls.dijkstra_directed(graph, u, v)
%                 D[u][v] = dist - h[u] + h[v]
%      


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

        