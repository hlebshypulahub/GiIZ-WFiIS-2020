function p4_demo(n, p, output_img_name)
close all;

n = str2num(n);
p = str2num(p);

am = readmatrix('test.dat');

%%%tutaj generuje i rysuje silnie spójny digraf:
strong_digraph = generate_strongly_connected_digraph(n,p);

graph_test = digraph(am);
D = johnson(graph_test) 
% D = johnson(strong_graph)

end