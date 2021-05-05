function sd = sum_graph_distances(distance_matrix)
sd = zeros(1, size(distance_matrix, 1));
    for i = 1:size(distance_matrix, 1)
        for j = 1:size(distance_matrix, 1)  
            sd(i) = sd(i) + distance_matrix(i,j); 
        end    
    end
end