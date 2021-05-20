function g = generate_strongly_connected_digraph(n,p)

strong_comp = ones(1,n);
components = zeros(1,n);

for i = 0:1000
    g = build_random_digraph(n, p);
    g = set_weights(g, -5, 10);
    am = full(adjacency(g));
    components = kosaraju(am);
    if isequal(components,strong_comp)
        break     
    end
end

if ~isequal(components,strong_comp)
     error('Nie udało się stworzyć silnie spójnego grafu skierowanego')
end

end