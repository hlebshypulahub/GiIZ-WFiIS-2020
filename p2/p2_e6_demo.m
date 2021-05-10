%%% jako argument ciąg graficzny

function p2_e6_demo(structure_path, output_img_name)
    close all;
    seq = dlmread(structure_path);
    if is_degree_seq(seq)
         g = AL_to_AM(DS_to_AL(seq));
         hamilton(g);
         g=graph(g);
         fig = draw_circle_graph(g);
         
         if ~exist('output_img_name', 'var')
             saveas(fig, sprintf('p2_e6_demo(%s).png', structure_path));
         else
             saveas(fig, output_img_name);
         end
    else
        error("Invalid sequence.")
    end
end