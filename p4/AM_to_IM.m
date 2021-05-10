function im  = AM_to_IM(am)
    if diff(size(am)) || trace(am) ~= 0
        error('Invalid adjacency matrix - the matrix is not a hollow matrix.');
    end

    [n, ~] = size(am);
    
    %%% Tabela pozycji niezerowych elementów macierzy sąsiedztwa
    pos = zeros(0, 2);
    for i = 1:n
        for j = 1:n
            if am(i, j) ~= 0
                pos(end+1, :) = [i j];
            end
        end
    end
    
    e = size(pos, 1);
    
    %%% Tworzę macierz incydencji jako 1 kolumnę wypełnioną zerami
    im = zeros(n, 1);

    %%% Tworzę kolumnę, wypełniam -1 źrodło i 1 cel,
    %%% wstawiam kolumnę do macierzy incydencji
    for i = 1:e
        column = zeros(n, 1);
        column(pos(i, 1)) = -1;
        column(pos(i, 2)) = 1;
        
        im = [im column];
    end
    
    %%% Usuwam pierwszą kolumnę
    im(:, 1) = [];
end   
