%%% jako argument ciąg graficzny
function p2_e6_demo(seq)
	seq = dlmread(seq);
    if is_degree_seq(seq)
         g = AL_to_AM(DS_to_AL(seq));
         hamilton(g);
         g=graph(g);
         draw_circle_graph(g);
    else
        error("Zła sekwencja")
    end
end