function hamilton_dfs_visit(am, n, vp, v, stack,visited)
    for i = 1:n
        if am(v, i)==1
            if visited(i) == 0
                visited(i) = 1;
                stack(end+1) = i;
                hamilton_dfs_visit(am, n, vp, i, stack, visited);
                if size(stack)==n 
                    if am(vp,stack(end))==1
                        return
                    end
                end
                visited(i) = 0;
                stack(end) = [];
            end
        end     
    end
end
