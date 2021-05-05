function hamilton(am)

g = graph(am);
c = components(g);
[n,m] = size(am);

o = repmat(1,n,1);

if c==o
    stack = [];
    visited = repmat(0,1,n);
    
    for i = 1:n
        if visited(i)==0
             visited(i) = 1;
             stack(end+1) = i;
             hamilton_dfs_visit(am, n, i, i, stack,visited);
             if size(stack)==n 
                 %disp("Pelny")
                 if am(v,stack(end))==1
                   %disp("Sparwdza caly")
                 end
             else
                visited(i) = 0;
                stack(end) = [];
             end
        end
    end
    if size(stack)==0
        error("Graf nie posiada cyklu hamiltona!")
    else
        disp("Cykl Hamiltona: ")
        disp(stack)
    end
else
    error("Graf musi być spójny!")
end

end

