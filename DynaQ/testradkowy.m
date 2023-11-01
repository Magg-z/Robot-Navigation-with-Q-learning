A= imread('comparison2.png');
GrayA= rgb2gray(A)/255;
BWA= imregionalmax(GrayA);

whos A
whos BWA
whos GrayA

imwrite(BWA,'comparison_image.png');