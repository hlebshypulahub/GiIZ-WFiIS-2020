clear; clc;

im = readmatrix('im_test.dat');

al_out = IM_to_AL(im);

IM_print(im);
AL_print(al_out);