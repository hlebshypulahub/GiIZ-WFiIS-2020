function Dijkstra(g, s)

%%% Bierzemy macierz sąsiedztwa
am = full(adjacency(g, 'weighted'));
al = AM_to_AL(am);

%%% Ilość wierzchołków
n = size(am, 1);

%%% Tabela oszacowanych wag najkrótszej ścieżki od wierzchołka s do v
d = Inf(n, 1);
d(s) = 0;

%%% Tabela poprzedników wierzchołka v w najkrótszej ścieżce z s do v
p = null(n, 1);

%%% Zbiór “gotowych” wierzchołków (początkowo jest pusty)
S = [];

%%% Iterujemy do momentu gdy w S będą już wszystkie wierzchołki
while size(unique(S), 1) ~= n

    %%% Tabela tempowa na przechowywanie niegotowych wierzchołków.
    %%% Inf na początku jako wartownik
    temp = Inf(1, 2);
    
    %%% Szukam w d wierzchołków nienależących do S i dodaję do temp
    for i = 1:size(d, 1)
        if ~ismember(i, S)
            temp(end+1, :) = [d(i), i];
        end
    end

    %%% Znajduję wierzchołek o najmniejszym d i przypisuję go do u
    [i, ~] = find(temp(:, 1) == min(temp(:, 1)));
    u = temp(i(1), 2);

    %%% Jeśli doszedło do wartownika, to koniec pętli
    if u == Inf
        break;
    end

    %%% S = S ∪ u
    S = union(u, S);

    %%% Relaksacja każdej krawędzi z u do tych wierzchołków,
    %%% które jeszcze nie należą do zbioru S
    for i = 1:size(al{u}, 2)
        if ~ismember(al{u}(i), S)
            if d(al{u}(i)) > d(u) + am(u, al{u}(i))
                d(al{u}(i)) = d(u) + am(u, al{u}(i));
                p(al{u}(i)) = u;
            end
        end
    end
end

print_shortest_path(d, p, s);

end