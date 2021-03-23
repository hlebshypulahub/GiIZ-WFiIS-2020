while true
   random_type = input('\nPodaj typ randomizacji\n1. G(n, l)\n2. G(n, p)\n0. Wyjście:\n');
   
   if random_type == 1
       n = input('\nPodaj ilość wierzchołków grafu: ');
       l = input('\nPodaj ilość krawędzi grafu: ');
       
       close all;
       
       g = build_randon_graph_by_edges(n, l);
       
       AM_print(full(adjacency(g)));
       AL_print(AM_to_AL(full(adjacency(g))));
%        IM_print(AM_to_IM(full(adjacency(g))));

       draw_circle_graph(g);
   elseif random_type == 2
       n = input('\nPodaj ilość wierzchołków grafu: ');
       p = input('\nPodaj prawdopodobieństwo istnienia krawędzi: ');
       
       close all;
       
       g = build_randon_graph_by_probability(n, p);
       
       AM_print(full(adjacency(g)));
       AL_print(AM_to_AL(full(adjacency(g))));
%        IM_print(AM_to_IM(full(adjacency(g))));

       draw_circle_graph(g);
   elseif random_type == 0
       close all;
       return;
   end
end