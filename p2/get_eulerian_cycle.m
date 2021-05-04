%%% funkcja przeszukująca w głąb graf i wyznaczająca cykl eulera

function eulerian_cycle = get_eulerian_cycle(g)
       eulerian_cycle = [];
       
       %%% macierz sąsiedztwa
       am = full(adjacency(g));
       
       %%% n - ilość wierzchołków grafu
       [n, ~] = size(g.Nodes);

       function dfs_euler(v)
           
            for u = 1:n
                if am(v,u) > 0
                   am(v,u) = am(v,u) - 1;
                   am(u,v) = am(u,v) - 1; 
                   dfs_euler(u);
                end
            end
            eulerian_cycle(end+1) = v;    
       end
   
       %%% początkowy wierzchołek cyklu losowany
       first_node = randi(n);
       dfs_euler(first_node);
end





