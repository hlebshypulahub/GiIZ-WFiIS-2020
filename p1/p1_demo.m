clear; clc;

%%% "C:\Users\hlebs\Desktop\SEMESTR 6\GRAFY\LABS\p1\al_test.dat"

input_type = input(strcat('Proszę podać typ struktury wejściowej\n',...
    '1 (lista sąsiedztwa),\n2 (macierz sąsiedztwa),\n3 (macierz incydencji):\n'));

file_path = input('\nProszę podać ścieżkę do pliku z strukturą: \n');

if input_type == 1
    al_string = fileread(file_path);
    al_lines = regexp(al_string, '\n', 'split').';
    al = cell(size(al_lines));
    for i = 1:size(al_lines)
        al{i} = str2num(al_lines{i});
    end

    im_out = AL_to_IM(al);
    am_out = AL_to_AM(al);

    AL_print(al);
    IM_print(im_out);
    AM_print(am_out);
    return;
elseif input_type == 2
    am = readmatrix(file_path);

    al = AM_to_AL(am);

    AM_print(am);
    AL_print(al);
    return;
elseif input_type == 3
    im = readmatrix('im_test.dat');

    al_out = IM_to_AL(im);

    IM_print(im);
    AL_print(al_out);
    return;
end

