function [fig, x_data, y_data] = draw_directed_weighted_graph(g, x_data, y_data)
[n, ~] = size(g.Nodes);

if ~exist('x_data', 'var') || ~exist('y_data', 'var')
    h = plot(g, 'LineWidth', 2, 'ArrowSize', 15, 'EdgeLabel', g.Edges.Weight, ...
        'EdgeColor', [0, 0, 0], 'MarkerSize', 30, 'Layout', 'layered', 'Direction', 'right', ...
        'NodeColor', [255, 150, 255]/255);
    x_data = h.XData;
    y_data = h.YData;
    h = plot(g, 'XData', x_data, 'YData', y_data, 'LineWidth', 2, 'ArrowSize', 15, 'EdgeLabel', g.Edges.Weight, ...
            'EdgeColor', [0, 0, 0], 'MarkerSize', 30,...
            'NodeColor', [255, 150, 255]/255);
    hold on;
else
    if size(x_data, 2) ~= size(g.Nodes, 1)
        x_data = [x_data max(x_data)-0.5];
        y_data = [y_data max(y_data)-0.5];
        h = plot(g, 'XData', x_data, 'YData', y_data, 'LineWidth', 2, 'ArrowSize', 15, 'EdgeLabel', g.Edges.Weight, ...
            'EdgeColor', [0, 0, 0], 'MarkerSize', 30,...
            'NodeColor', [255, 150, 255]/255);
        hold on;
    else
        h = plot(g, 'XData', x_data, 'YData', y_data, 'LineWidth', 2, 'ArrowSize', 15, 'EdgeLabel', g.Edges.Weight, ...
            'EdgeColor', [0, 0, 0], 'MarkerSize', 30,...
            'NodeColor', [255, 150, 255]/255);
        hold on;
    end
end

for i = 1:n
    plot(h.XData(i), h.YData(i), 'o', 'MarkerEdgeColor', 'k', 'MarkerSize', 30)
end

h.EdgeFontSize = 14;

text(h.XData, h.YData, h.NodeLabel, ...
    'VerticalAlignment', 'Middle', ...
    'HorizontalAlignment', 'Center', ...
    'FontSize', 18)

h.NodeLabel = {};

x_data = h.XData;
y_data = h.YData;

set(gcf, 'units', 'normalized', 'outerposition', [0, 0, 1, 1]);

fig = gcf;
end