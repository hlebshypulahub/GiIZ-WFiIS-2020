function p4_e1_demo(n, p, output_img_name)
close all;

n = str2num(n);
p = str2num(p);

g = build_random_digraph(n, p);

g = set_weights(g, -5, 10);

am = full(adjacency(g, 'weighted'));
AM_print(am);
al = AM_to_AL(am);
AL_print(al);
im = AM_to_IM(am);
IM_print(im);

fig = draw_directed_weighted_graph_layered_layout(g);
if ~exist('output_img_name', 'var')
    saveas(fig, sprintf('p4_e1_demo(%d, %d).png', n, p));
else
    saveas(fig, output_img_name);
end

end