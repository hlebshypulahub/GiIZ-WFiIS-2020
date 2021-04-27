function print_shortest_path(d, p, s)
fprintf('\nSTART: s = %d\n', s);
for i = 1:size(d, 1)
    fprintf('d(%d) = %d ==> [', i, d(i));

    u = [];
    u(end+1) = i;
    while u(end) ~= s
        u(end+1) = p(u(end));
    end

    u = fliplr(u);

    for j = 1:size(u, 2)
        if j == size(u, 2)
            fprintf('%d', u(j));
        else
            fprintf('%d, ', u(j));
        end
    end

    fprintf(']\n');
end
fprintf('\n');
end