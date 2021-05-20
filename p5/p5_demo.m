function p5_demo(N, output_img_name)
close all;

N = str2num(N);

[g, layer_nodes] = build_random_flow_network(N);

[f, max_flow] = ford_fulkerson(g);

fig = draw_flow_network(g, f, layer_nodes);
if ~exist('output_img_name', 'var')
    saveas(fig, sprintf('p5_demo(%d).png', N));
else
    saveas(fig, output_img_name);
end

fprintf(sprintf('\nWartość maksymalnego przepływu: %d\n\n', max_flow));

end