function g = build_random_k_reg_graph(n,k)
%%na podstawie argumentów tworzymy ciąg graficzny
a = repmat(k,1,n);
if k>=n
    error("Stopień wierzchołków musi być mniejszy!")
end

%%jeżeli z ciągu graficzny jest sekwencją,
%%to na jej podstawie tworzymy losowy graf, który dalej randomizujemy

if is_degree_seq(a)
    al = DS_to_AL(a);
    am = AL_to_AM(al);
    g=graph(am);
    g = rand_graph(g,k);
    draw_circle_graph(g);
else
    error("Nie można zbudować grafu k-regularnego dla danej liczby wierchołków")
    
end