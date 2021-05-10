function fig = draw_directed_weighted_graph(g)
    [n, ~] = size(g.Nodes);
    
    h = plot(g, 'LineWidth', 2, 'ArrowSize', 15, 'EdgeLabel', g.Edges.Weight,...
    'EdgeColor', [0 0 0], 'MarkerSize', 30, 'Layout', 'layered', 'Direction', 'right',...
    'NodeColor', [255 150 255]/255);
    hold on;
    
    for i = 1:n
        plot(h.XData(i),h.YData(i), 'o', 'MarkerEdgeColor', 'k', 'MarkerSize', 30)
    end
    
    h.EdgeFontSize=14;
        
    text(h.XData, h.YData, h.NodeLabel,...
    'VerticalAlignment','Middle',...
    'HorizontalAlignment', 'Center',...
    'FontSize', 18)

    h.NodeLabel = {};
    
    set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
    
    fig = gcf;
end