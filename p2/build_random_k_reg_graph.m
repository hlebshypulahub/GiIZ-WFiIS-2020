function g = build_random_k_reg_graph(n,k)

a = repmat(k,1,n);
if k>=n
    error("Stopień wierzchołków musi być mniejszy!")
end

if is_degree_seq(a)
    al = DS_to_AL(a);
    am = AL_to_AM(al);
    g=graph(am);
    g = rand_graph(g,k);
    draw_circle_graph(g);
else
    error("Nie można zbudować grafu k-regularnego dla danej liczby wierchołków")
    
end

