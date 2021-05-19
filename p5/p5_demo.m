function p5_demo(N)
close all;

N = str2num(N);

[g, layer_nodes] = build_random_flow_network(N);

fig = draw_flow_network(g, layer_nodes);
% if ~exist('output_img_name', 'var')
%     saveas(fig, sprintf('p4_demo(%d, %d).png', n, p));
% else
%     saveas(fig, output_img_name);
% end

ford_fulkerson(g, layer_nodes);

end