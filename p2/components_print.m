function largest = components_print(comp)
    nr = unique(comp);
    
    fprintf('\nComponents:\n');
    for n = 1:size(nr, 1)
        fprintf('%d. ', nr(n));
        fprintf('%d ', find(comp == nr(n)));
        fprintf('\n');
    end
    
    fprintf('The largest component(s) -> ');
    fprintf('%d; ', largest_component(comp));
    fprintf('\n');
end