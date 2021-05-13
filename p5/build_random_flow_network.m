function [g, layer_nodes] = build_random_flow_network(N)

if N < 2
    error('Number of intermediate layers of the flow network must be greater than 1');
end

%%% Na końcach mamy po jednym wierzchołku,
%%% natomiast w środku losuję od 2 do N wierzchołków
%%% dla każdej z N pośrednich warstw
node_num_in_layers = [1 randi([2 N], [1, N]) 1];

%%% cellarray - przechowuję numery wierzchołków w każdej warstwie
layer_nodes = cell(N + 2, 1);

%%% Wypełniam pierwszą warstwę wierzchołkiem o numerze 1
layer_nodes{1} = (1);
for i = 2:N + 2
    %%% Biorę numer ostatniego wierzchołka z poprzedniej warstwy,
    %%% wypełniam aktualną warstwę kolejnymi numerami zgodnie z ilością
    layer_nodes{i} = (layer_nodes{i-1}(end)+1:1:layer_nodes{i-1}(end)+node_num_in_layers(i));
end

%%% Losuję krawędzie i wypełniam macierz -
%%% para wierzchołków u -> v w każdym wierszu
edges = zeros(0, 2);
for i = 2:N+1
    for j = layer_nodes{i}
        %%% Losuję krawędź wchodzącą
        edges(end+1, :) = [layer_nodes{i-1}(randperm(length(layer_nodes{i-1}), 1)) j];
        %%% Losuję krawędź wychodzącą
        edges(end+1, :) = [j layer_nodes{i+1}(randperm(length(layer_nodes{i+1}), 1))];
    end
end

%%% Usuwam powtarzające się krawędzie
edges = unique(edges, 'rows');

%%% Liczę maksymalną ilość krawędzi możliwych na tym grafie zgodnie z
%%% regułami flow network.
max_edges = length(layer_nodes{2}) + length(layer_nodes{N+1});
for i = 2:N
    max_edges = max_edges + length(layer_nodes{i}) - 1;
	max_edges = max_edges + length(layer_nodes{i}) * length(layer_nodes{i+1});
end
max_edges = max_edges + length(layer_nodes{N+1}) - 1;

%%% Dodaję 2N losowych krawędzi
loops = 0;
while loops < 2*N && size(edges, 1) < max_edges
    
    %%% Losuję warstwę pośrednią
    random_layer = randi([2, N+1]);
    %%% Losuję wierzchołek u z wylosowanej warstwy
    u = layer_nodes{random_layer}(randperm(length(layer_nodes{random_layer}), 1));

    if random_layer == 2
        %%% Wtedy do dyzpozycji mamy wierzchołki warstwy 2 i 3.
        %%% Nie możemy losować krawędzie dla źródła
        temp_nodes = [layer_nodes{2} layer_nodes{3}];
    elseif random_layer == N+1
        %%% Wtedy do dyzpozycji mamy wierzchołki warstwy przedostatniej i przedprzed.
        %%% Nie możemy losować krawędzie dla ujścia
        temp_nodes = [layer_nodes{N} layer_nodes{N+1}];
    else
        %%% Wtedy do dyzpozycji mamy wierzchołki warstwy wylosowanej i 2
        %%% bezpośrednich sąsiednich warstw
        temp_nodes = [layer_nodes{random_layer-1} layer_nodes{random_layer} layer_nodes{random_layer+1}];
    end

    %%% Losuję wierzchołek v z dostępnych
    v = temp_nodes(randperm(length(temp_nodes), 1));

    if u == v
        continue;
    end
    
    %%% Jeśli wierzchołek u i v są z jednej warstwy, ale nie są
    %%% bezpośrednimi sąsiadami
    if ismember(v, layer_nodes{random_layer}) && abs(u - v) ~= 1
        continue;
    end
    
    %%% Jeśli krawędź u->v lub v->u nie istnieje
    if ~ismember([u v], edges, 'rows') && ~ismember([v u], edges, 'rows')
        edges = [edges; u v];
        loops = loops + 1;
    end
end

layers_print(layer_nodes);

g = digraph(edges(:, 1), edges(:, 2), ones(1, size(edges, 1)));
g = set_weights(g, 1, 10);
end





















