%%% Konwersja Macierzy incydencji do Listy sąsiedztwa
function al = IM_to_AL(im)
    %%% Sprawdza, że macierz wejściowa zawiera tylko {0,1}
    if ~all(ismember(im(:), [0, 1]))
        error('Matrix must contain only {0,1}');    
    end
    
    %%% Sprawdza, że każda krawędź ma być połączona z dokładnie dwoma
    %%% wierzchołkami
    for i = 1:size(im, 2)
        if nnz(im(:, i)) ~= 2
            error('Invalid incidence matrix - each edge must be connected to two nodes.');
        end
    end
    
    %%% Konwertujemy wierszy macierzy do komórki, szukamy w wierszu 1 i
    %%% zapisujemy indeksy. Tworzymy tak kształt listy
    al = cellfun(@(x) find(x), num2cell(im, 2), 'UniformOutput', false);
    
    %%% Pobieramy rozmiar macierzy
    [n, m] = size(im);
    
    %%% Czyścimy listę, żeby w kolejnym kroku zacząć poprawnie dodawać
    %%% sąsiadów
    for i = 1:n
        al{i} = [];
    end
    
    %%% Ta macierz ma w każdej kolumnie jedną albo dwie jedynki.
    %%% Czyli krawędź ma należeć do jednego albo dwóch wierzchołków.
    %%% Problem polega na odnalezieniu pozycji tych jedynek i wzajemnym
    %%% dodaniu na listę sąsiedztwa.
    %%% Pętla najpierw po m, a w środku po n,
    %%% bo chcemy chodzić po macierzy pionowo
    for j = 1:m
        %%% Wartość tempowa oznacza indeks pierwszego wierzchołka
        %%% dla tej krawędzi
        first_node_index = 0;
        for i = 1:n
            %%% Jeżeli znajdujemy 1
            if im(i, j) == 1
                %%% Jeżeli indeks pierwszego jest 0, to nadajemy mu wartość i
                if first_node_index == 0
                    first_node_index = i;
                %%% W przypadku już istniejącego pierwszego wierzchołka
                %%% odnalezienie 1 oznacza odnalezienie drugiego dla tej
                %%% krawędzi. Czyli musimy dodać tych sąsiadów wzajemnie na
                %%% listę
                else
                    al{first_node_index}(end + 1) = i;
                    al{i}(end + 1) = first_node_index;
                end
            end
        end
    end
end






















