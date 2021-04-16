function p1_e3_e2_demo(rand_type, nodes, value)    
   if strcmp(rand_type, '--nl')              
       g = build_randon_graph_by_edges(str2num(nodes), str2num(value));
   elseif strcmp(rand_type, '--np')        
       g = build_randon_graph_by_probability(str2num(nodes), str2num(value));
   else
       error('Unrecognized option "%s";', rand_type);
   end
   AM_print(full(adjacency(g)));
   AL_print(AM_to_AL(full(adjacency(g))));
   IM_print(AM_to_IM(full(adjacency(g))));

   draw_circle_graph(g);
end