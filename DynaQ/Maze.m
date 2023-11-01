clc; clear all; close all;

MazeRGB=imread('mag.png');

figure(1)
imshow(MazeRGB)

% Convert RGB to grayscale using NTSC weighting [Image Toolbox]
Gray = rgb2gray(MazeRGB)/255;

% Image Toolbox
BW = imregionalmax(Gray);

figure(6)
imshow(BW)
~BW; %to reverse values, because i want 1 to be an obstacle

whos MazeRGB %writes parameters in Command Window
whos Gray
whos BW
