%%% jako argument ciąg graficzny
function p2_e6_demo(structure_path)

    seq = dlmread(structure_path);
    if is_degree_seq(seq)
         g = AL_to_AM(DS_to_AL(seq));
         hamilton(g);
         g=graph(g);
         draw_circle_graph(g);
    else
        error("zła sekwencja")
    end
end