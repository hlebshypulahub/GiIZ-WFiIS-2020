function p4_e4_demo(n, p, output_img_name)
close all;

n = str2num(n);
p = str2num(p);

am = readmatrix('test.dat');

%%%tutaj generuje i rysuje silnie spójny digraf:
strong_digraph = generate_strongly_connected_digraph(n, p);

% graph_test = digraph(am);
% D = johnson(graph_test)
[graph, new_graph, D] = johnson(strong_digraph);

D_print(D);

[fig1, x_data, y_data] = draw_directed_weighted_graph(strong_digraph);
figure;
[fig2, ~, ~] = draw_directed_weighted_graph(graph, x_data, y_data);
figure;
[fig3, ~, ~] = draw_directed_weighted_graph(new_graph, x_data, y_data);
if ~exist('output_img_name', 'var')
    saveas(fig1, sprintf('p4_e4_demo(%d, %d)_strong_digraph.png', n, p));
    saveas(fig2, sprintf('p4_e4_demo(%d, %d)_graph_with_positive_edges.png', n, p));
    saveas(fig3, sprintf('p4_e4_demo(%d, %d)_digraph_with_node_S.png', n, p));
else
    saveas(fig1, strcat(output_img_name, '_strong_digraph.png'));
    saveas(fig2, strcat(output_img_name, '_graph_with_positive_edges.png'));
    saveas(fig3, strcat(output_img_name, '_digraph_with_node_S.png'));
end
end