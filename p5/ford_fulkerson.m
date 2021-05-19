function ford_fulkerson(g, layer_nodes)

%%pobieramy macierz sąsiedztwa z wagami:
am = full(adjacency(g, 'weighted'));
[n,m]=size(am);
%%wyzerowanie przepływów
f = zeros(n);

%%tworzymy sieć rezydualną (jej macierz sąsiedztwa):
res_am = zeros(n);
%%ustalamy jej strukturę według wzoru:
for i = 1:n
    for j = 1:n
        if am(i,j)~=0
            res_am(i,j) = am(i,j)-f(i,j);
        elseif am(j,i)~=0
            res_am(i,j) = f(i,j);  
        else
            res_am(i,j)=0;    
        end
    end
end

res_g = digraph(res_am);
%figure
%fig = draw_flow_network(res_g, layer_nodes);

%sprawdzamy ilość wierzchołków w sieci
[sum, ~] = size(g.Nodes);
p=true;

while  p     %warunek  przesukiwania wszerz w sieci rezudualnej - dopóki istnieje ścieżka s-t% 
    [p, path] = bfs(res_g,1,sum);
    path2 = [ 1 path(1:end) sum];
    c_f = [];
    for i = 1:size(path2,2)-1
        c_f(end+1) = res_am(path2(i), path2(i+1)); %%zbieram wagi połączeń na ścieżce
    end
    minimum = min(c_f); %%wybieram minimalną wagę
    for i = 1:size(path2,2)-1
        res_am(path2(i), path2(i+1)) = minimum; %%ustawiam tą minimalna wagę na ścieżce
    end
    
    for i = 1:size(path2,2)-1
        if am(path2(i), path2(i+1)) ~=0; %%jeśli ścieżka należy do grafu G
            f(i,j) = f(i,j) + res_am(path2(i), path2(i+1));
        else
            f(i,j) = f(i,j) - res_am(path2(i), path2(i+1));
        end
    end
    res_g = digraph(res_am);
end


max_flow = max(f(:));
sprintf('Wartość maksymalnego przepływu: %d', max_flow)
end
