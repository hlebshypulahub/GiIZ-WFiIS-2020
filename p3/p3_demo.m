function p3_demo(nodes, edges, start)
    close all;
    clc;
    nodes = str2num(nodes);
    edges = str2num(edges);
    start = str2num(start);

    g = graph;

    count = 0;
    while (~is_connected(g) && count < 100)
        g = build_randon_graph_by_edges(nodes, edges);
        count = count + 1;
    end

    if ~is_connected(g)
        error('Connectivity unreachable, try other input arguments;');
    end

    %%% losuje wagi
    g = set_weights(g, 1, 10);

    %%% 1 przekazuję gdy chcę wypisać listę z zadania 2 dla podanego 
    %%% wierzchołka startowego
    Dijkstra(g, start, 1);

    %%% macierz odległości
    dm = distance_matrix(g);
    print_matrix(dm, nodes);

    %%% centrum grafu “to wierzchołek, którego suma 
    %%% odległości do pozostałych wierzchołków jest minimalna“

    %%% tablica sum odległości do pozostałych wierzchołków
    sum_distances = sum_graph_distances(dm);

    %%% zdarza się, że takich wierzchołków będących
    %%% centrum grafu jest więcej niż 1
    center_of_graph = graph_center(g, sum_distances);
    
    min_sum = distances_sum(sum_distances);

    fprintf('Center of graph:');
    disp(center_of_graph);
    fprintf('Sum of distances:\t%d',min_sum);

    %%% centrum minimax ”to wierzchołek, którego odległość 
    %%% do najdalszego wierzchołka jest minimalna“

    %%% tablica największych odległości dla danego wierzchołka
    md = max_distances(g, dm);

    %%% zdarza się, że takich wierzchołków będących
    %%% centrum minimax jest więcej niż 1
    cm = center_minimax(g, md);
    
    minimax_distance = graph_minimax_distance(md);
    
    fprintf('\n\nCenter minimax:');
    disp(cm);
    fprintf('Distance:\t%d\n',minimax_distance);
    
    %%% minimalne drzewo rozpinające
    %%% algorytm prima
    tree_g = prim(g);
    
    fig = draw_weighted_graph_tree(g, tree_g);
    saveas(fig, sprintf('p3_demo(%d, %d, %d).png', nodes, edges, start));
end