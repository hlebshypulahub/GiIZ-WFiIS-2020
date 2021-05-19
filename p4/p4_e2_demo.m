function p4_e2_demo(n, p, output_img_name)
close all;

n = str2num(n);
p = str2num(p);

g = build_random_digraph(n, p);

g = set_weights(g, -5, 10);


fig = draw_directed_weighted_graph(g);

disp('test algorytmu Kosaraju: - składowe dla wierzchołków grafu')
am = full(adjacency(g));
components = kosaraju(am)

end