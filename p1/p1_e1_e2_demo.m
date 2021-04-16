function p1_e1_e2_demo(input_type, structure_path)

if strcmp(input_type, '--al')
    al_string = fileread(structure_path);
    al_lines = regexp(al_string, '\n', 'split').';
    al = cell(size(al_lines));
    for i = 1:size(al_lines)
        al{i} = str2num(al_lines{i});
    end

    im = AL_to_IM(al);
    am = AL_to_AM(al);

    AL_print(al);
    IM_print(im);
    AM_print(am);
    g = graph(am);
    draw_circle_graph(g);
    return;
elseif strcmp(input_type, '--am')
    am = readmatrix(structure_path);

    al = AM_to_AL(am);
    im = AM_to_IM(am);

    AM_print(am);
    AL_print(al);
    IM_print(im);
    g = graph(am);
    draw_circle_graph(g);
    return;
elseif strcmp(input_type, '--im')
    im = readmatrix(structure_path);

    al = IM_to_AL(im);
    am = IM_to_AM(im);

    IM_print(im);
    AL_print(al);
    AM_print(am);
    g = graph(am);
    draw_circle_graph(g);
    return;
else
    error('Unrecognized option "%s";', input_type);
end
end

