function g = set_weights(g, min, max)
    am = full(adjacency(g));
    [n, ~] = size(am);
    for i = 1:n
        for j = 1:n
            if am(i, j) == 1
                am(i, j) = randi([min, max]);
            end
        end
    end

    g = digraph(am);
end