function draw_circle_graph_with_components(g, comp, largest)
    [n, ~] = size(g.Nodes);
    
    step = (2 * pi) / n;
    
    angle = (pi / 2 : -step : - (3 * pi / 2) + step);
    
    x = zeros(1, n);
    y = x;
    
    
    for i = 1:n
        x(i) = cos(angle(i));
        y(i) = sin(angle(i));
    end
    
    %%% Okrąg
    ang=0:0.01:2*pi; 
    xp=cos(ang);
    yp=sin(ang);
    plot(xp, yp, 'LineStyle', ':', 'Color', [150 150 150]/255);
    hold on;
    
    %%% Graf
    h = plot(g, 'XData', x, 'YData', y, 'LineWidth', 3,...
    'EdgeColor', 'k', 'MarkerSize', 20,...
    'NodeColor', [255 255 180]/255, 'NodeFontSize', 16);
    hold on;
    
    %%% Wypełnia wierzchołki największej spójnej
    %%% składowej na czerwono
    unq = unique(comp);
    for i = 1:size(unique(comp), 1)
        if ~ismember(unq(i), largest)
            highlight(h, find(comp == unq(i)),...
                'NodeColor', [187 187 255]/255);
        end
    end

    %%% Wypełnia krawędzi największej spójnej
    %%% składowej na niebiesko
    for i = 1:size(g.Edges, 1)
        if ~ismember(comp(g.Edges.EndNodes(i, 1)), largest) ...
                && ~ismember(comp(g.Edges.EndNodes(i, 2)), largest)
            highlight(h, g.Edges.EndNodes(i, :), 'LineWidth', 1.5,...
                'EdgeColor', [255 50 50]/255);
        end
    end
    
    %%% Wierzchołki (czarny obwód)
    for i = 1:n
        plot(h.XData(i),h.YData(i), 'o', 'MarkerEdgeColor', 'k', 'MarkerSize', 20)
    end
    
    %%% Numery wierzchołków
    text(h.XData, h.YData, h.NodeLabel,...
    'VerticalAlignment','Middle',...
    'HorizontalAlignment', 'Center',...
    'FontSize', 12)

    text(0.40, 1.25, '━━', 'FontWeight', 'bold',...
        'FontSize', 25, 'Color', [100 100 100]/255);
    text(0.60, 1.25, 'Krawędź największej',...
        'FontSize', 10, 'Color', 'black');
    text(0.60, 1.2, 'spójnej składowej',...
        'FontSize', 10, 'Color', 'black');
    text(0.40, 1.10, '•', 'FontWeight', 'bold',...
        'FontSize', 40, 'Color', [255 255 180]/255);
    text(0.60, 1.10, 'Wierzchołek największej',...
        'FontSize', 10, 'Color', 'black');
    text(0.60, 1.05, 'spójnej składowej',...
        'FontSize', 10, 'Color', 'black');

    %%% Usuwa stare numery
    h.NodeLabel = {};
    
    set(gcf,'position',[100, 100 , 800, 760])
end