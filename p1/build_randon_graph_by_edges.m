function g = build_randon_graph_by_edges(n, l)
    %%% Tworzymy macierz sąsiedztwa, wypełniamy zerami
    am = zeros(n, n);
    
    %%% nchoosek(n, k)
    %%% Liczymy liczbę kombinacji n wziętych k razy na raz.
    %%% k musi być nie większe od n, bo wtedy dostaniemy error.
    %%% Dlaczego tak?
    %%% Dostajemy tutaj liczbę elementów macierzy, znajdujących
    %%% się poniżej przekątnej. Będzie ich zawsze:
    %%% (wszystkie elementy - n) / 2.
    %%% Właśnie poniżej przekątnej będziemy losować l jedynek,
    %%% wstawiać ich na pozycje (i, j) oraz (j, i), bo macierz
    %%% sąsiedztwa jest symetryczna wzg przękątnej
    comb = nchoosek(n, 2);
    
    %%% Generujemy vector l intów z przedziału [1 comb] bez powtórzeń.
    %%% Losujemy tak naprawdę kolejne miejsca na te jedynki poniżej
    %%% przekątnej. Jak mamy comb miejsc, to mamy na te comb miejsc
    %%% wylosować l krawędzi bez powtórzeń.
    perm_vector = randperm(comb, l);
    
    %%% Index tempowy oznacza aktualne miejsce (na którym stoimy)
    %%%  w macierzy poniżej przekątnej
    temp_index = 1;
    
    %%% Idziemy po elementach poniżej przekątnej, nie wchodząc na przekątną
    for i = 2:n
        for j = 1:i-1
            %%% Sprawdzamy, jeśli dane miejsce istnieje w naszym wektorze
            %%% miejsc, to wstawiamy jedynkę tutaj oraz symetrycznie
            %%% powyżej przekątnej
            if ismember(temp_index, perm_vector)
                am(i, j) = 1;
                am(j, i) = 1;
            end
            %%% + 1, bo przechodzimy do kolejnego miejsca
            temp_index = temp_index + 1;
        end
    end
    
    g = graph(am);
end