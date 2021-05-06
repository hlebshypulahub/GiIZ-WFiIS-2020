%%% sprawdzenie czy funkcja get_eulerian_cycle jest poprawna
function test_eulerian_cycle()
    close all;
    
    %%% macierz sąsiedztwa grafu, który ma dwie spójne składowe 
    %%% połączone dwoma mostami (graf jest eulerowski)
    am=readmatrix('am.dat');
    g=graph(am);
        
    draw_circle_graph(g);

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