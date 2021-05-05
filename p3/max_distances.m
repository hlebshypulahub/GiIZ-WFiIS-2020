function md = max_distances(g, dm)
md = zeros(1, size(g.Nodes, 1));
    for i = 1:size(g.Nodes, 1)
        for j = 1:size(g.Nodes, 1)  
            md(i) = max(dm(i,:)); 
        end    
    end
end