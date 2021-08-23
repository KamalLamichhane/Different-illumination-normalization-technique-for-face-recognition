%function im=illumination_control(im);

clc;
close all;
clear all;
tic;
a=imread('110.tif');
a=rgb2gray(a);
%a=a(:,:,2);
%a=imresize(a,[256 256]);
figure, imshow(a);
%First level decomposition
[im_dwt]=dwtbasedillumcontrl(a);
[im_histeq]=histbasedillumcontrl(a);
[a]=logarithmic(a);
[im_TVL1]=TVL1denoise(a, 1.0, 100);
toc;

