function p2_e1_e2_e3_demo(structure_path, k)
        clc;
        seq = dlmread(structure_path);
        if is_degree_seq(seq)
            DS_print(seq);
            al = DS_to_AL(seq);
            am = AL_to_AM(al);
            
            g = graph(am);
            g = rand_graph(g, str2double(k));
            
            comp = components(g);
            
            largest = components_print(comp);
            
            draw_circle_graph_with_components(g, comp, largest);
        else
            disp('Ciąg');
            fprintf('%d ', seq(1, 1:size(seq, 2)));
            disp(' ');
            disp('nie jest ciągiem graficznym grafu.');
        end
end