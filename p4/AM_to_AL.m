function al = AM_to_AL(am)
    if diff(size(am)) || trace(am) ~= 0
        error('Invalid adjacency matrix - the matrix is not a hollow matrix.');
    end
    
    al = cellfun(@(x) find(x), num2cell(am, 2), 'UniformOutput', false);
end