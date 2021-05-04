function p3_demo(nodes, edges, start)

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

    g = set_weights(g, 1, 10);

    draw_weighted_graph(g);

    %%% 1 przekazuję gdy chcę wypisać listę z zadania 2 dla podanego 
    %%% wierzchołka startowego
    Dijkstra(g, start, 1);

    %%% macierz odległości
    distance_matrix = zeros(nodes,nodes);
    for i = 1:nodes
        distance_matrix(i,:) = Dijkstra(g,i,0);
    end
    print_matrix(distance_matrix, nodes);

    %%% centrum grafu “to wierzchołek, którego suma 
    %%% odległości do pozostałych wierzchołków jest minimalna“

    %%% tablica sum odległości do pozostałych wierzchołków
    sum_distances = zeros(1,nodes);
    for i = 1:nodes
        for j = 1:nodes  
            sum_distances(i) = sum_distances(i) + distance_matrix(i,j); 
        end    
    end

    %%% zdarza się, że takich wierzchołków będących
    %%% centrum grafu jest więcej niż 1, dlatego tablica
    center_of_graph = [];

    %%% minimalna suma z tablicy
    min_sum = min(sum_distances);
    for i = 1:nodes
        if min_sum == sum_distances(i)
            center_of_graph(end+1) = i;
        end
    end

    fprintf('Center of graph:');
    disp(center_of_graph);
    fprintf('Sum of distances:\t%d\n',min_sum);

    %%% centrum minimax ”to wierzchołek, którego odległość 
    %%% do najdalszego wierzchołka jest minimalna“

    %%% tablica największych odległości dla danego wierzchołka
    max_distances = zeros(1,nodes);
    for i = 1:nodes
        for j = 1:nodes  
            max_distances(i) = max(distance_matrix(i,:)); 
        end    
    end

    %%% zdarza się, że takich wierzchołków będących
    %%% centrum minimax jest więcej niż 1, dlatego tablica
    center_minimax = [];

    %%% minimalna odleglosc z tablicy
    minimax_distance = min(max_distances);
    for i = 1:nodes
        if minimax_distance == max_distances(i)
            center_minimax(end+1) = i;
        end
    end
    
    fprintf('\n\nCenter minimax:');
    disp(center_minimax);
    fprintf('Distance:\t%d\n',minimax_distance);

end