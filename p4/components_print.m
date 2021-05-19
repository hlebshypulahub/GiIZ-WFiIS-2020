function components_print(comp)
    nr = unique(comp);
    
    fprintf('\nComponents:\n');
    for n = nr
        fprintf('%d. ', n);
        fprintf('%d ', find(comp == n));
        fprintf('\n');
    end
    
    fprintf('\n');
end