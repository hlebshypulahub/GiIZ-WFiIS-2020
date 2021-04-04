function draw_circle_graph(g)
    [n, ~] = size(g.Nodes);
    
    step = (2 * pi) / n;
    
    angle = (pi / 2 : -step : - (3 * pi / 2) + step);
    
    x = zeros(1, n);
    y = x;
    
    
    for i = 1:n
        x(i) = cos(angle(i));
        y(i) = sin(angle(i));
    end
    
    ang=0:0.01:2*pi; 
    xp=cos(ang);
    yp=sin(ang);
    plot(xp, yp, 'LineStyle', ':', 'Color', [17 17 17]/255);
    hold on;
    
    h = plot(g, 'XData', x, 'YData', y, 'LineWidth', 2,...
    'EdgeColor', [0 0 0], 'MarkerSize', 20,...
    'NodeColor', [187 187 255]/255, 'NodeFontSize', 16);
    hold on;
    
    for i = 1:n
        plot(h.XData(i),h.YData(i), 'o', 'MarkerEdgeColor', 'k', 'MarkerSize', 20)
    end
        
    text(h.XData, h.YData, h.NodeLabel,...
    'VerticalAlignment','Middle',...
    'HorizontalAlignment', 'Center',...
    'FontSize', 12)

    h.NodeLabel = {};
    
    set(gcf,'position',[100, 100 , 800, 760])
end