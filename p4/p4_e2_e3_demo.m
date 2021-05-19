function p4_demo(n, p, output_img_name)
close all;

n = str2num(n);
p = str2num(p);

g = build_random_digraph(n, p);

g = set_weights(g, -5, 10);


%test algorytmu Kosaraju:
am = full(adjacency(g));
components = kosaraju(am);

%%%tutaj generuje i rysuje silnie spójny digraf:
strong_digraph = generate_strongly_connected_digraph(n,p);

[result, paths ] = bellman_ford(strong_digraph,n,0);

end