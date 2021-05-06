function dm = distance_matrix(g)

dm = zeros(size(g.Nodes, 1), size(g.Nodes, 1));
    for i = 1:size(g.Nodes, 1)
        dm(i,:) = Dijkstra(g,i,0);
    end
end