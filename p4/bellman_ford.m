function [result, d] = bellmann_ford(g, s, h)

%%% Bierzemy macierz sąsiedztwa
am = full(adjacency(g, 'weighted'));

%%% Ilość wierzchołków
n = size(am, 1);

%%% init
d = Inf(n, 1);
d(s) = 0;
p = null(n, 1);

result = true;
%relaksancja
for k=1:n-1
    for i = 1:n
            for j = 1:n
                if am(i,j)~=0 | (j==h | i==h)
                    if d(j) > d(i) + am(i, j)
                        d(j) = d(i) + am(i, j);
                        p(j) = i;
                    end
                end
            end
    end
end
    
    for i = 1:n
        for j = 1:n
            if am(i,j)~=0
                if d(j) > d(i) + am(i, j)
                    result = false;
                end
            end
        end
    end
end