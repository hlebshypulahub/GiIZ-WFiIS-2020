function D_print(d)
    [n, m] = size(d);
    fprintf('\nMatrix D:\n');
    for i = 1:n
        fprintf('%d\t', d(i, 1:m));
        fprintf('\n');
    end
    fprintf('\n');
end