%%% jako argument ciąg graficzny

function p2_e6_demo(structure_path)
    close all;
    seq = dlmread(structure_path);
    if is_degree_seq(seq)
         g = AL_to_AM(DS_to_AL(seq));
         hamilton(g);
         g=graph(g);
         fig = draw_circle_graph(g);
         saveas(fig, sprintf('p2_e6_demo(%s).png', structure_path));
    else
        error("Zła sekwencja")
    end
end