%%% Konwersja Listy sąsiedztwa do Macierzy incydencji
function im = AL_to_IM(al)
    %%% Pobieramy rozmiar wymiaru n
    [n, ~] = size(al);
    
    %%% m reprezentuje sumę stopni wierzchołków,
    %%% ustawiamy na 0
    m = 0;
    
    %%% Liczymy sumę stopni wierzchołków poprzez
    %%% pobranie kolejnych wierszy listy
    for i = 1:n
        [~, m_temp] = size(al{i});
        m = m + m_temp;
    end
    
    %%% Sprawdzamy, że suma stopni jest parzysta,
    %%% żeby móc policzyć ilość krawędzi
    if mod(m, 2) == 1
        error('Invalid adjacency list - sum of vertices degrees is not even.');
    end
    
    %%% Liczymy rozmiar wymiaru m i tworzymy macierz
    m = m / 2;
    im = zeros(n, m);
    
    %%% Tworzymy indeks tempowy z którym będziemy przechodzić
    %%% po kolejnych kolumnach macierzy (krawędziach)
    m_temp_index = 1;
    
    
    for i = 1:n
        %%% Pobieramy rozmiar aktualnego wierszu listy
        [~, m_temp] = size(al{i});
        for j = 1:m_temp
            %%% Pobieramy sąsiada
            neighbour = al{i}(j);
            %%% Wstawiamy 1 tu
            im(i, m_temp_index) = 1;
            %%% Oraz tu. Czyli w 2 końcach krawędzi
            im(neighbour, m_temp_index) = 1;
            %%% Usuwamy element o wartości (i) z wierszu sąsiada
            for k = 1:size(al{neighbour})
               if al{neighbour}(k) == i
                   al{neighbour}(k) = [];
               end
            end
            %%% Indeks tempowy ++.
            %%% *Warunek - nie może przekroczyć ilość krawędzi
            m_temp_index = m_temp_index + 1;
        end
    end
end