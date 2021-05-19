function d = Dijkstra_digraphs(g, s)

%%% Bierzemy macierz sąsiedztwa
am = full(adjacency(g));
am_w = full(adjacency(g, 'weighted'));
al = AM_to_AL(am);

%%% Ilość wierzchołków
n = size(am, 1);

%%% Tabela oszacowanych wag najkrótszej ścieżki od wierzchołka s do v
d = Inf(n, 1);
d(s) = 0;

%%% Tabela poprzedników wierzchołka v w najkrótszej ścieżce z s do v
p = null(n, 1);

%%% Zbiór “niegotowych” wierzchołków
not_ready = 1:1:n;

%%% Iterujemy do momentu gdy w nie przejdziemy wszystkie wierzchołki
c = 0;
while size(not_ready, 2) ~= 0
    if c > 10
        break;
    end
    1
    not_ready
    X = size(not_ready, 2)

    u = not_ready(1);
    
    for i = not_ready
        if d(i) < d(u)
            u = i;
        end
    end
    
    for i = 1:size(not_ready, 2)
        2
        if not_ready(i) == u
            not_ready(i) = [];
            break;
        end
    end
    
    for v = not_ready
        if am(u, v) == 1
            if d(v) > d(u) + am_w(u, v)
                d(v) = d(u) + am_w(u, v);
                p(v) = u;
            end
        end
    end
    3
    c = c + 1;
end
end