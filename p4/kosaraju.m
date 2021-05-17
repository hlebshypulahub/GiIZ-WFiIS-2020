function comp = kosaraju(am)
[n,m] = size(am);

comp = repmat(-1,1,n);
d=repmat(-1,1,n);
f=repmat(-1,1,n);
%vp = 1; 
t=0;

    for i = 1:n  
        if d(i)==-1
             d(i) = 1;        %%oznaczamy wierzchołek jako odwiedzony i wstawiamy na stos
             %stack(end+1) = i;
             %vp = i;
             %disp(vp)
             DFS_visit(i); 
        end
    end
        
        tam = am.';
        %%transpozycja grafu
        %posortuj kopię f[v] i bierz w pętli w kolejności malejących f[v]
        sf = sort(f,'descend');
        
        nr =0;
        for i =1: n
            [r,c] = find(f==sf(i));
            c;
            if comp(c)==-1
                nr = nr+1;
                comp(c)=nr;
                Components_R(c)
            end
            
        end
comp;


    function DFS_visit(i)
        t = t+1;
        d(i) = t;
        
        for j = 1:n
            if am(i, j)==1
                %disp('fff');
                j;
                if d(j) == -1
                    %disp('dfs_visit_demand_done');
                    j;
                    DFS_visit(j)
                end
            end
        end
        t = t+1;
        f(i) = t;
    end

    function Components_R(v)
        for j = 1:n
            if tam(v, j)==1
                if comp(j) == -1
                    comp(j)=nr;
                    Components_R(j);
                end
            end
        end
        
    end
end
