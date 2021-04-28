function g = build_randon_graph_by_probability(n, p)
if (p < 0 || p > 1)
    error('Probability must be in the range [0, 1], but You typed %d;', p);
end

am = zeros(n);

%%% Idziemy poniżej przekątnej,
%%% jeżeli rand() <= prawdopodobieństwa, to wstawiamy jedynkę
%%% w to miejsce oraz symetrycznie powyżej przekątnej
for i = 2:n
    for j = 1:i - 1
        if rand() <= p
            am(i, j) = 1;
            am(j, i) = 1;
        end
    end
end

g = graph(am);
end