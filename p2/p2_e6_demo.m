%%% jako argument ciąg graficzny
<<<<<<< HEAD
function p2_e6_demo(seq)
	seq = dlmread(seq);
=======
function p2_e6_demo(structure_path)

    seq = dlmread(structure_path);
>>>>>>> ff4a49b343306f882245c7fd91942bb3e1d71c9f
    if is_degree_seq(seq)
         g = AL_to_AM(DS_to_AL(seq));
         hamilton(g);
         g=graph(g);
         draw_circle_graph(g);
    else
        error("Zła sekwencja")
    end
end