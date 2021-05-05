function center_of_graph = graph_center(g, sum_distances)
center_of_graph = [];

    %%% minimalna suma z tablicy
    min_sum = min(sum_distances);
    for i = 1:size(g.Nodes, 1)
        if min_sum == sum_distances(i)
            center_of_graph(end+1) = i;
        end
    end
end