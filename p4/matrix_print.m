function matrix_print(mat)
    [n, m] = size(mat);
    for i = 1:n
        fprintf('%d\t', mat(i, 1:m));
        fprintf('\n');
    end
    fprintf('\n');
end