function largest = largest_component(comp)
    nr = unique(comp);
    
    sizes = zeros(size(nr, 1), 1);
    
    for n = 1:size(nr, 1)
        sizes(n) = size(find(comp == nr(n)), 1);
    end
    
    largest = find(sizes == max(sizes));
end