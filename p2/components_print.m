function largest = components_print(comp)
    nr = unique(comp);
    
    sizes = zeros(size(nr, 1), 1);
    
    fprintf('\nComponents:\n');
    for n = 1:size(nr, 1)
        fprintf('%d. ', nr(n));
        fprintf('%d ', find(comp == nr(n)));
        fprintf('\n');
        
        sizes(n) = size(find(comp == nr(n)), 1);
    end
    
    largest = find(sizes == max(sizes));
    
    fprintf('The largest component(s) -> ');
    fprintf('%d; ', largest);
    fprintf('\n');
end