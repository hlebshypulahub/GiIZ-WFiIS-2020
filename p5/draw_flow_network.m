function fig = draw_flow_network(g, f, layer_nodes)
    g_temp = g;
    for i = 1:size(g.Edges, 1)
        g_temp.Edges.Weight(i) = f(g.Edges.EndNodes(i, 1), g.Edges.EndNodes(i, 2));
    end
    
    g_zero = digraph(f);
    
    [n, ~] = size(g.Nodes);
    
    xdata = [];
    for i = 1:size(layer_nodes, 1)
        for j = layer_nodes{i}
            xdata(end+1) = i;
        end
    end
    
    ydata = [];
    ydata(end+1) = 0.5;
    for i = 2:size(layer_nodes, 1)-1
        temp = (1/(size(layer_nodes{i}, 2)+1))+(randi([2, 10])/100);
        ydata = [ydata temp:(1-2*temp)/(size(layer_nodes{i}, 2)-1):1-temp];
    end
    ydata(end+1) = 0.5;

    h = plot(g, 'YData', ydata, 'XData', xdata,...
    'LineWidth', 1, 'ArrowSize', 15,...
    'EdgeColor', [0 0 0], 'MarkerSize', 30,...
    'NodeColor', [255 255 150]/255, 'ArrowSize', 25);
    hold on;
    
    for i = 1:n
        plot(h.XData(i),h.YData(i), 'o', 'MarkerEdgeColor', 'k', 'MarkerSize', 30)
    end
    
    for i = 1:size(g.Edges, 1)
        labeledge(h, g.Edges.EndNodes(i, 1), g.Edges.EndNodes(i, 2), sprintf('%d/%d', g_temp.Edges.Weight(i), g.Edges.Weight(i)));
    end
    
    highlight(h, g_zero, 'EdgeColor', 'b', 'LineWidth', 5);
    
    h.EdgeFontSize=15;
        
    text(h.XData, h.YData, h.NodeLabel,...
    'VerticalAlignment','Middle',...
    'HorizontalAlignment', 'Center',...
    'FontSize', 18)

    h.NodeLabel = {};
       
    set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
    
    fig = gcf;
end