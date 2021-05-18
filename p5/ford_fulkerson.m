function ford_fulkerson(g, layer_nodes)

%%wagi na pewno weźmiemy z macierzy sąsiedztwa:
am = full(adjacency(g, 'weighted'));
[n,m]=size(am);
%%wyzerowanie przepływów (??)
f = zeros(n);


%%tworzymy sieć rezydualną:
res_am = zeros(n)

for i = 1:n
    for j = 1:n
        if am(i,j)~=0
            res_am(i,j) = am(i,j); %-f(i,j)     %to przypisanie nie działa niestety
        elseif am(j,i)~=0
            res_am = f(i,j);  
        else
            res_am(i,j)=0;    
        end
    end
end
res_am
res_g = digraph(res_am);
figure
%%tworzy ok raczej, można by wyrysować tak jak sieć ale nie wiem jak z
%%layer nodes
fig = draw_directed_weighted_graph(res_g);

%%w layer nodes mamy ilość wierzchołków w każdej warstwie,
layer_nodes
[n, m] = size(layer_nodes);
sum=1;
for i = 2:n
    for j = layer_nodes{i}
        %liczę ilość wierzchołków w sieci (chyba się przyda)
        sum=sum+1;
    end
end
sum; %sprawdza czy dobrze zliczyło ilość wierzchołków od źródła do ujścia

%bfs(res_g,1,sum);
%while bfs(res_g,1,sum) %tu jakoś warunek na przesukiwanie wszerz w sieci rezudualnej% 
    %%bfs zwraca ścieżkę
    %path = bfs(res_g,1,sum)
    
    %tu warunki 
    
    
%end

end
