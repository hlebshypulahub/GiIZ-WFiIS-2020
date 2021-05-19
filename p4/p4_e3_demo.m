function p4_e3_demo(n, p, output_img_name)
close all;

n = str2num(n);
p = str2num(p);

%%%tutaj generuje i rysuje silnie spójny digraf:
strong_digraph = generate_strongly_connected_digraph(n,p);

fig = draw_directed_weighted_graph_layered_layout(strong_digraph);
if ~exist('output_img_name', 'var')
    saveas(fig, sprintf('p4_demo(%d, %d).png', n, p));
else
    saveas(fig, output_img_name);
end

[result, paths] = bellman_ford(strong_digraph,n,0);

end