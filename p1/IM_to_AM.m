function am = IM_to_AM(im)
n = size(im);

    %%% Sprawdza, że każda krawędź ma być połączona z dokładnie dwoma
    %%% wierzchołkami
    for i = 1:size(im, 2)
        if nnz(im(:, i)) ~= 2
            error('Invalid incidence matrix - each edge must be connected to two nodes.');
        end
    end

am = zeros(n(1), n(1));

for j = 1:n(2)
    idx = [-1, -1];
    for i = 1:n(1)
        if im(i, j) == 1
            if idx(1) == -1
                idx(1) = i;
            else
                am(idx(1), i) = 1;
                am(i, idx(1)) = 1;
                break
            end
            %znajdujemy indeksy wierzchołków które łączy krawędż i wpisujemy w odpowiednie miejsce AM indeksy
        end
    end
end
end
