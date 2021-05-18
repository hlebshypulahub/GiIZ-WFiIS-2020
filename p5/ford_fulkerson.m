function ford_fulkerson(g, layer_nodes)

%%wagi na pewno weźmiemy z macierzy sąsiedztwa:
am = full(adjacency(g, 'weighted'));
[n,m]=size(am)
%%wyzerowanie przepływów (??)
f = zeros(n)

%%w layer nodes mamy ilość wierzchołków w każdej warstwie,
layer_nodes
[n, m] = size(layer_nodes)
sum=1;
for i = 2:n
    for j = layer_nodes{i}
        %liczę ilość wierzchołków w sieci (chyba się przyda)
        sum=sum+1;
    end
end
sum %sprawdza czy dobrze zliczyło

while bfs(g,1,sum)
    
    
end





end