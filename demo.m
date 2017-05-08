clc
clear all
close all

img = imread('test1.tif');
figure
imshow(img)
title('original image')

se1=strel('disk',5);  % size of structuring element used in opening by reconstruction
se2=strel('disk',7);  % size of structuring element used in closing by reconstruction

outMask=nucleiSeg(img,se1,se2);
figure
imshow(outMask)
title('mask of segmented image')