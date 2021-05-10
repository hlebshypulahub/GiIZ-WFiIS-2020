function p2_e1_e2_e3_demo(structure_path, k, output_img_name)
        close all;
        clc;
        seq = dlmread(structure_path);
        k = str2double(k);
        
        if is_degree_seq(seq)
            DS_print(seq);
            al = DS_to_AL(seq);
            am = AL_to_AM(al);
            
            g = graph(am);
            g = rand_graph(g, k);
            
            comp = components(g);
            
            largest = largest_component(comp);
            
            components_print(comp);
            
            fig = draw_circle_graph_with_components(g, comp, largest);
            
            if ~exist('output_img_name', 'var')
                saveas(fig, sprintf('p2_e1_e2_e3_demo(%s, %d).png', structure_path, k));
            else
                saveas(fig, output_img_name);
            end
            
        else
            disp('Ciąg');
            fprintf('%d ', seq(1, 1:size(seq, 2)));
            disp(' ');
            disp('nie jest ciągiem graficznym grafu.');
        end
end