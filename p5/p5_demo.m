function p5_demo(N)
close all;

N = str2num(N);

[g, layer_nodes] = build_random_flow_network(N);

fig = draw_flow_network(g, layer_nodes);

end