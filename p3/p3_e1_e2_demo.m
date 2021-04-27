function p3_e1_e2_demo(nodes, edges, start)

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

Dijkstra(g, start);

end