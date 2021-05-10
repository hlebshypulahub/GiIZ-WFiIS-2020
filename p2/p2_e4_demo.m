%%% n - ilość wierzchołków podana jako argument

function p2_e4_demo(n, output_img_name)
    close all;
    n = str2double(n);

    if n < 3
        error('Enter a number greater than 2');
    else
        g = create_eulerian_graph(n);
        
        fig = draw_circle_graph(g);

        if ~exist('output_img_name', 'var')
            saveas(fig, sprintf('p2_e4_demo(%d).png', n));
        else
            saveas(fig, output_img_name);
        end

        cycle = get_eulerian_cycle(g);
        [~, size_cycle] = size(cycle);

        disp('Eulerian cycle:');
        fprintf('[');
        for i=1:size_cycle-1
            fprintf('%d - ', cycle(i));
        end
        fprintf('%d]', cycle(size_cycle));
        fprintf('\n');
    end
end