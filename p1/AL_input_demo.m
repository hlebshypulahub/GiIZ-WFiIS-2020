clear; clc;

file_path = input('Proszę podać ścieżkę do pliku z listą sąsiedztwa: \n');

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