function g = generate_strongly_connected_digraph(n,p)

strong_comp = repmat(1,1,n);
components =repmat(0,1,n);
i=0;

while ~isequal(components,strong_comp)
    g = build_random_digraph(n, p);
    am = full(adjacency(g));
    components = kosaraju(am);
    
end
components
g = set_weights(g, -5, 10);
%disp('Nie udało się zbudować grafu')

end