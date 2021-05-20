function p4_e4_demo(n, p, output_img_name)
close all;

n = str2num(n);
p = str2num(p);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Testowanie na grafie z input_4.pdf z UPEL %%%%%
%%%%% Proszę odkomentować to poniżej___________ %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% am = readmatrix('test.dat');
% graph_test = digraph(am);
% [graph, new_graph, D_test] = johnson(graph_test);
% fprintf('\nTestowy graf z pdf z UPEL:');
% D_print(D_test);
% [fig11, x_data, y_data] = draw_directed_weighted_graph(graph_test);
% figure;
% [fig22, ~, ~] = draw_directed_weighted_graph(graph, x_data, y_data);
% figure;
% [fig33, ~, ~] = draw_directed_weighted_graph(new_graph, x_data, y_data);
% figure;
% if ~exist('output_img_name', 'var')
%     saveas(fig11, sprintf('p4_e4_demo(%d, %d)_digraph_test.png', n, p));
%     saveas(fig22, sprintf('p4_e4_demo(%d, %d)_digraph_test_with_positive_edges.png', n, p));
%     saveas(fig33, sprintf('p4_e4_demo(%d, %d)_digraph_test_with_node_S.png', n, p));
% else
%     saveas(fig11, strcat(output_img_name, '_digraph_test.png'));
%     saveas(fig22, strcat(output_img_name, '_digraph_test_with_positive_edges.png'));
%     saveas(fig33, strcat(output_img_name, '_digraph_test_with_node_S.png'));
% end


strong_digraph = generate_strongly_connected_digraph(n, p);
[graph, new_graph, D] = johnson(strong_digraph);
D_print(D);

if ~exist('output_img_name', 'var')
    [fig1, x_data, y_data] = draw_directed_weighted_graph(strong_digraph);
figure;
    saveas(fig1, sprintf('p4_e4_demo(%d, %d)_strong_digraph.png', n, p));
    [fig2, ~, ~] = draw_directed_weighted_graph(graph, x_data, y_data);
figure;
    saveas(fig2, sprintf('p4_e4_demo(%d, %d)_digraph_with_positive_edges.png', n, p));
    [fig3, ~, ~] = draw_directed_weighted_graph(new_graph, x_data, y_data);
figure;
    saveas(fig3, sprintf('p4_e4_demo(%d, %d)_digraph_with_node_S.png', n, p));
else
    [fig1, x_data, y_data] = draw_directed_weighted_graph(strong_digraph);
figure;
    saveas(fig1, strcat(output_img_name, '_strong_digraph.png'));
        [fig2, ~, ~] = draw_directed_weighted_graph(graph, x_data, y_data);
figure;
    saveas(fig2, strcat(output_img_name, '_digraph_with_positive_edges.png'));
    [fig3, ~, ~] = draw_directed_weighted_graph(new_graph, x_data, y_data);
    saveas(fig3, strcat(output_img_name, '_digraph_with_node_S.png'));
end
end