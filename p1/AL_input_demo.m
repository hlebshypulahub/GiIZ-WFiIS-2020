clear; clc;

al_string = fileread('al_test.dat');
al_lines = regexp(al_string, '\r\n|\r|\n', 'split').';
al = cell(size(al_lines));
for i = 1:size(al_lines)
    al{i} = str2num(al_lines{i});
end

im_out = AL_to_IM(al);

AL_print(al);
IM_print(im_out);