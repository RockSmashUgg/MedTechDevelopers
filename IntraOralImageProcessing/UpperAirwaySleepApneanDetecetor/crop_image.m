clear all;
clc;

I = imread('circuit.tif');
I2 = imcrop(I,[75 68 130 112]);
imshow(I), figure, imshow(I2)