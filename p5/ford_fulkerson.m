function ford_fulkerson(g)

%%pobieramy macierz sąsiedztwa z wagami:
am = full(adjacency(g, 'weighted')); %%przepustowości sieci wyjściowej
[n, ~]=size(am);
%%wyzerowanie przepływów
f = zeros(n);

%%tworzymy sieć rezydualną (jej macierz sąsiedztwa):
res_am = zeros(n);      %%przepustowości rezydualne
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

%sprawdzamy ilość wierzchołków w sieci
[n, ~] = size(g.Nodes);
%pierwsze poszukiwanie ścieżki s - t
[p, ~] = bfs(res_g,1,n);

while  p     %warunek  przesukiwania wszerz w sieci rezudualnej - dopóki istnieje ścieżka s-t% 
    [p, path] = bfs(res_g,1,n);
    path2 = [ 1 path(1:end) n];
    c_f = [];
    for i = 1:size(path2,2)-1
        c_f(end+1) = res_am(path2(i), path2(i+1)); %%zbieram wagi połączeń na ścieżce
    end
    
    minimum = min(c_f); %%wybieram minimalną wagę
    for i = 1:size(path2,2)-1
        res_am(path2(i), path2(i+1)) = res_am(path2(i), path2(i+1)) - minimum; %%ustawiam tą minimalna wagę na ścieżce
        res_am(path2(i+1), path2(i)) =   minimum;
    end
    
    for i = 1:size(path2,2)-1
        if am(path2(i), path2(i+1)) ~=0 %%jeśli ścieżka należy do grafu G
            f(path2(i), path2(i+1)) = f(path2(i), path2(i+1)) + res_am(path2(i+1), path2(i));
        else
            f(path2(i+1),path2(i)) = f(path2(i+1),path2(i)) - res_am(path2(i), path2(i+1));
        end
    end
    res_g = digraph(res_am);
    %%jeśli to odkomentujecie to widać jak się zmienia sieć rezydualna i
    %%flow
    %fg=digraph(f);
    %figure
    %fig = draw_flow_network(res_g, layer_nodes);  
    %figure
    %fig = draw_flow_network(fg, layer_nodes);   
end

max_flow = sum(f(1,:));
fprintf(sprintf('\nWartość maksymalnego przepływu: %d\n\n', max_flow));
end
