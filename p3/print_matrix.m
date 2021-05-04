function print_matrix(matrix, nodes)
    fprintf('Distance matrix:\n');
    for i = 1:nodes
        fprintf('%2d ', matrix(i, 1:nodes));
        fprintf('\n');
    end
    fprintf('\n');
end