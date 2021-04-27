function draw_weighted_graph(g)
    [n, ~] = size(g.Nodes);
    
    LWidths = 5*g.Edges.Weight/max(g.Edges.Weight);
    h = plot(g, 'LineWidth', LWidths, 'EdgeLabel', g.Edges.Weight,...
    'EdgeColor', [0 0 0], 'MarkerSize', 20, 'Layout', 'layered',...
    'NodeColor', [255 150 255]/255);
    hold on;
    
    for i = 1:n
        plot(h.XData(i),h.YData(i), 'o', 'MarkerEdgeColor', 'k', 'MarkerSize', 20)
    end
    
    h.EdgeFontSize=10;
        
    text(h.XData, h.YData, h.NodeLabel,...
    'VerticalAlignment','Middle',...
    'HorizontalAlignment', 'Center',...
    'FontSize', 14)

    h.NodeLabel = {};
    
    set(gcf,'position',[100, 100 , 800, 760])
end