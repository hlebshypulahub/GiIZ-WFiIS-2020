function result = bfs(g,s,t)

d = Inf(t, 1);
d(s) = 0;
p = null(t, 1);

Q = []; %kolejka Q
%Q(end+1) = s; %wstawiam s na początek
%komentarz bo pętla na razie nie dokończona, żeby wrakunek był prawdziwy

while ~isequal(Q,[])
    
   disp('do') 
end

%result false aby pętla w wywołaniu na razie nie chodziła w nieskończoność
result = false
end