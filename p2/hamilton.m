function hamilton(am)
%%postać wejściowa jako macierz sąsiedztwa
%%reprezentacja g dla sprawdzenia spójności
g = graph(am);
c = components(g);
[n,m] = size(am);

%%jeśli graf spójny to wszystki wierzchołki należą do jednej składowej (nr
%%1), więc tworzymy wektor jedynek dla sprawdzenia warunku
o = repmat(1,n,1);

%%przygotowanie stosu oraz tablicy do oznaczania wierzchołków odwiedzonych,
%%oraz zmiennej dla wierzchołka poczatkowego
stack = [];
visited = repmat(0,1,n);
vp = 1;        

%%rozpoczynamy jeśli graf jest spójny
if c==o
    for i = 1:n  
        if visited(i)==0
             visited(i) = 1;        %%oznaczamy wierzchołek jako odwiedzony i wstawiamy na stos
             stack(end+1) = i;
             vp = i;
             disp(vp)
             dfs_visit(i);       %%pierwsze wywołanie rekurencyjnej metody
             [a,b] = size(stack);
             if b==n
                 if am(i,stack(end))==1     %%kontrolujemy czy wszystkie wierzchołki są na stosie 
                   stack(end+1) = i;
                 end
             end
             visited(i) = 0;
             stack(end) = [];
        end
    end
    [a,b] = size(stack);
    if b==0
        disp("Graf nie posiada cyklu hamiltona!")
    else
        disp("Cykl Hamiltona: ")
        stack(end+1)=vp;
        disp(stack)
    end
else
    error("Graf musi być spójny!")
end

%%przeszukujemy graf w głąb rekurencyjnie
function dfs_visit(v)
    for j = 1:n
        if am(v, j)==1
            if visited(j) == 0
                visited(j) = 1;
                stack(end+1) = j;
                %disp(stack)
                dfs_visit(j);
                [a,b] = size(stack);
                
                if b==n
                    if am(vp,stack(end))==1
                        return
                    end
                end
                visited(j) = 0;
                stack(end) = [];
            end
        end     
    end
end

end