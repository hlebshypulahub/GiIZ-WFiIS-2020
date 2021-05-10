function g = build_random_digraph(n, p)
if (p < 0 || p > 1)
    error('Probability must be in the range [0, 1], but You typed %d;', p);
end

am = zeros(n);

for i = 1:n
    for j = 1:n
        if rand() <= p && i ~= j
            am(i, j) = 1;
        end
    end
end

g = digraph(am);
end