function DS_print(ds)
    [~, m] = size(ds);
    fprintf('\nDegree sequence:\n');
    fprintf('%d ', ds(1, 1:m));
    fprintf('\n');
end