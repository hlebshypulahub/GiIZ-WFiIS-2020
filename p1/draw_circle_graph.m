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
    
    plot(g, 'XData', x, 'YData', y, 'LineWidth', 1.5,...
    'EdgeColor', 'k', 'MarkerSize', 7, 'NodeFontSize', 16);
    hold on;
    ang=0:0.01:2*pi; 
    xp=cos(ang);
    yp=sin(ang);
    plot(xp, yp, 'LineStyle', ':', 'Color', [17 17 17]/255);
    
    set(gcf,'position',[100, 100 , 800, 760])
end