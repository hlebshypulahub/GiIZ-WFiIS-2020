function draw_weighted_graph_tree(g, tree_g)
    [n, ~] = size(g.Nodes);
    
    LWidths = 6*g.Edges.Weight/max(g.Edges.Weight);
    h = plot(g, 'LineWidth', LWidths, 'EdgeLabel', g.Edges.Weight,...
    'EdgeColor', [200 200 200]/255, 'MarkerSize', 20, 'Layout', 'auto',...
    'NodeColor', [255 150 255]/255);
    hold on;
    
    for i = 1:n
        plot(h.XData(i),h.YData(i), 'o', 'MarkerEdgeColor', 'k', 'MarkerSize', 20);
    end

    highlight(h, tree_g, 'EdgeColor', 'r');
    
    h.EdgeFontSize=10;
        
    text(h.XData, h.YData, h.NodeLabel,...
    'VerticalAlignment','Middle',...
    'HorizontalAlignment', 'Center',...
    'FontSize', 14);

    h.NodeLabel = {};
    
    set(gcf,'position',[100, 100 , 800, 760]);
end