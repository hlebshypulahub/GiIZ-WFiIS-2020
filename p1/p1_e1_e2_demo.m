function p1_e1_e2_demo(input_type, structure_path)

%%% "C:\Users\hlebs\Desktop\SEMESTR 6\GRAFY\LABS\p1\al_test.dat"

% input_type = input(strcat('Proszę podać typ struktury wejściowej\n',...
%     '1 (lista sąsiedztwa),\n2 (macierz sąsiedztwa),\n3 (macierz incydencji):\n'));

% file_path = input('\nProszę podać ścieżkę do pliku z strukturą: \n');

% file_path_demo = "C:\Users\hlebs\Desktop\SEMESTR 6\GRAFY\LABS\p1\al_test.dat";

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

    AM_print(am);
    AL_print(al);
    draw_circle_graph(am);
    return;
elseif strcmp(input_type, '--im')
    im = readmatrix(structure_path);

    al_out = IM_to_AL(im);

    IM_print(im);
    AL_print(al_out);
    return;
end
end

