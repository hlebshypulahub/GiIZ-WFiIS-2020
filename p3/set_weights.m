function g = set_weights(g, min, max)
    am = full(adjacency(g));
    [n, ~] = size(am);
    for i = 2:n
        for j = 1:i-1
            if am(i, j) == 1
                am(i, j) = randi([min, max]);
                am(j, i) = am(i, j);
            end
        end
    end

    g = graph(am);
end