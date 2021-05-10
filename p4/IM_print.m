function IM_print(im)
    [n, m] = size(im);
    fprintf('\nIncidence matrix:\n');
    for i = 1:n
        fprintf('%d\t', im(i, 1:m));
        fprintf('\n');
    end
    fprintf('\n');
end