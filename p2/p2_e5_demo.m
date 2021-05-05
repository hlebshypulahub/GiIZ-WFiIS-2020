%%% n - ilość wierzchołków podana jako argument

function p2_e5_demo(n, k)
<<<<<<< HEAD

n = str2num(n);
k = str2num(k);

=======
    n = str2num(n);
    k = str2num(k);
>>>>>>> ff4a49b343306f882245c7fd91942bb3e1d71c9f
    if str2double(n) < 3
        error('Enter a number greater than 2');
    else
        g = build_random_k_reg_graph(n,k);
    end
    
end