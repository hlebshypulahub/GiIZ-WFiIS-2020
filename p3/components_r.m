function comp = components_r(nr, i, comp, al)
    for j = 1:size(al{i}, 2)
        if comp(al{i}(j)) == -1
            comp(al{i}(j)) = nr;
            comp = components_r(nr, al{i}(j), comp, al);
        end
    end
end