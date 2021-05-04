%%% n - ilość wierzchołków podana jako argument

function p2_e4_demo(n)

    if str2double(n) < 3
        disp('Enter a number greater than 2');
    else
        g = create_eulerian_graph(n);

        cycle = get_eulerian_cycle(g);
        [~, size_cycle] = size(cycle);

        disp('Eulerian cycle:');
        fprintf('[');
        for i=1:size_cycle-1
            fprintf('%d - ', cycle(i));
        end
        fprintf('%d]', cycle(size_cycle));
    end
end