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

ang = 0:0.01:2 * pi;
xp = cos(ang);
yp = sin(ang);
plot(xp, yp, 'LineStyle', ':', 'Color', [17, 17, 17]/255);
hold on;

ang = pi / 2:2 * pi / n:2 * pi + pi / 2;
xp = cos(ang);
yp = sin(ang);
radii = 0.075;

xp = fliplr(xp);
yp = fliplr(yp);

[e, ~] = size(g.Edges);

for i = 1:e
    line([xp(g.Edges.EndNodes(i, 1)), xp(g.Edges.EndNodes(i, 2))], ...
        [yp(g.Edges.EndNodes(i, 1)), yp(g.Edges.EndNodes(i, 2))], ...
        'Color', 'k', 'LineWidth', 2);
end

xp = fliplr(xp);
yp = fliplr(yp);

for i = 1:n
    rectangle('Position', [xp(i) - radii, yp(i) - radii, 2 * radii, 2 * radii], ...
        'Curvature', [1, 1], 'FaceColor', [255, 150, 255]/255, ...
        'EdgeColor', 'b', 'LineWidth', 1);
    hold on;
end

xp = fliplr(xp);
yp = fliplr(yp);

for i = 1:n
    text(xp(i), yp(i), "" +i, ...
        'VerticalAlignment', 'Middle', ...
        'HorizontalAlignment', 'Center', ...
        'FontSize', 14)

    hold on;
end

set(gcf, 'position', [10, 50, 800, 760])
end