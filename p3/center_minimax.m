function cm = center_minimax(g, md)
    cm = [];

    %%% minimalna odleglosc z tablicy
    minimax_distance = min(md);
    for i = 1:size(g.Nodes, 1)
        if minimax_distance == md(i)
            cm(end+1) = i;
        end
    end
end