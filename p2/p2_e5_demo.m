%%% n - ilość wierzchołków podana jako argument

function p2_e5_demo(n, k, output_img_name)
    close all;
    n = str2num(n);
    k = str2num(k);

    if str2double(n) < 3
        error('Enter a number greater than 2');
    else
        g = build_random_k_reg_graph(n,k);
        fig = draw_circle_graph(g);
        
        if ~exist('output_img_name', 'var')
            saveas(fig, sprintf('p2_e5_demo(%d, %d).png', n, k));
        else
            saveas(fig, output_img_name);
        end
    end
    
end