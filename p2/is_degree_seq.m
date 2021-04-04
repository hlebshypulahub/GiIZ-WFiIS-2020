function is_degree_seq = is_degree_seq(seq)
    [~, n] = size(seq);

    seq = sort(seq, 'descend');
    
    if mod(size(find(mod(seq, 2) ~= 0), 2), 2) ~= 0
        is_degree_seq = false;
        return;
    end
    
    while true
        if all(seq == 0)
            is_degree_seq = true;
            return;
        end

        if (seq(1) < 0 ...
            || seq(1) >= n ...
            || size(find(seq < 0), 2) > 0)
            is_degree_seq = false;
            return;
        end
        
        for i = 2:seq(1)+1
            seq(i) = seq(i) - 1;
        end
        
        seq(1) = 0;
        seq = sort(seq, 'descend');
    end
end