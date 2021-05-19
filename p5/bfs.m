function [result , path] = bfs(g,s,t)
%%inicjujemy zmienne
d = Inf(t, 1);
d(s) = 0;
p = null(t, 1);

am = full(adjacency(g, 'weighted'));

Q = []; %kolejka Q
Q(end+1) = s; %wstawiam s na początek

while ~isequal(size(Q,2),0)
    v = Q(end);
    Q(end) = [];
    for j = 1:t
        if am(v,j)~=0
            if d(j)== Inf
                d(j) = d(v) +1;
                p(j)=v;
                Q(end+1)=j;
                if j==t  %%warunek przerwania, jeżeli mamy już scieżkę do źródła
                    break
                end
            end
        end
    end
end

path = [];
result = true;

if d(t)==Inf
   result = false;
else
    while ~(p(t)==s)
        path(end+1) = p(t);
        t=p(t);
    end
end
path = flip(path);
end
