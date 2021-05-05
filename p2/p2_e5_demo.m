%%% n - ilość wierzchołków podana jako argument

function p2_e5_demo(n, k)

n = str2num(n);
k = str2num(k);

    if str2double(n) < 3
        error('Enter a number greater than 2');
    else
        g = build_random_k_reg_graph(n,k);
    end
    
end