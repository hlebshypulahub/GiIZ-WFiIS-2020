function AM_print(am)
    [n, m] = size(am);
    fprintf('\nAdjacency matrix:\n');
    for i = 1:n
        fprintf('%d\t', am(i, 1:m));
        fprintf('\n');
    end
    fprintf('\n');
end