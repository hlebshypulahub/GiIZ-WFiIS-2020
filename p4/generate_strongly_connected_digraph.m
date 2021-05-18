function g = generate_strongly_connected_digraph(n,p)

strong_comp = repmat(1,1,n);
components =repmat(0,1,n);
i=0;
%{
while ~isequal(components,strong_comp)
    g = build_random_digraph(n, p);
    am = full(adjacency(g));
    components = kosaraju(am);
    i=i+1;
end
%}
for i = 0:100
    g = build_random_digraph(n, p);
    g = set_weights(g, -5, 10);
    am = full(adjacency(g));
    components = kosaraju(am);
    if isequal(components,strong_comp)
        break     
    end
end
i;
%am = full(adjacency(g));
%comp = kosaraju(am)
%components
%strong_comp

% fig = draw_directed_weighted_graph(g);
        
%disp('Nie udało się zbudować grafu')

end