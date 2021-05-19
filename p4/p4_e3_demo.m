function p4_e3_demo(n, p, output_img_name)
close all;

n = str2num(n);
p = str2num(p);

%%%tutaj generuje i rysuje silnie spójny digraf:
strong_digraph = generate_strongly_connected_digraph(n,p);

[result, paths] = bellman_ford(strong_digraph,n,0);

end