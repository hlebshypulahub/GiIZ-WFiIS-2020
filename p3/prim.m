%%% algorytm prima

function edges = prim(g)
        %%% n - ilość wierzchołków
        [n, ~] = size(g.Nodes);
        edges = [];

        W = [];
        T = [];
        for i = 1:n
            W(end+1) = i;
        end
        W
        
        %%% dowolny wierzchołek startowy (tutaj: pierwszy) dodajemy 
        %%% do pustego drzewa T, a pozostałe wierzchołki tworzą zbiór W
        W(1) = [];
        T(1) = 1;
        
        %%% wykonuj, dopóki T nie zawiera jeszcze wszystkich wierzchołków
%         while size(T) ~= n
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
            
            interesting_edges
            e = g.Edges
            
            %%% sortowanie interesujących nas krawędzi
%             sort(interesting_edges, key=lambda e: e.get_weight())
%             edges.append(interesting_edges[0])
%             nodes_of_edge = interesting_edges[0].get_nodes_ids()
%             node_1_id = nodes_of_edge[0].get_id()
%             node_2_id = nodes_of_edge[1].get_id()
%             if node_1_id in T:
%                 T.append(node_2_id)
%                 W.remove(node_2_id)
%             else:
%                 T.append(node_1_id)
%                 W.remove(node_1_id)

%         end
 end