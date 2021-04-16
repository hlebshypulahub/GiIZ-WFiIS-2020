clear; clc;

am = readmatrix('am_test.dat');

al = AM_to_AL(am);

AM_print(am);
AL_print(al);