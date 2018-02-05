clc;clf;clear all;
I = imread('Fig0.tif');
RGB=imread('lena1.jpg');             %�����ɫͼƬ
im=rgb2gray(RGB);                   %��ɫת���ɻҶ�ͼ
%im=double(rgb2gray(imread('Fig1.jpg')));
%im=imread('Fig1.jpg');
GLCM = graycomatrix(I,'Offset',[0 1]);
glcm = graycomatrix(im,'Offset',[0 1]);

figure(1),
imshow(I);
figure(2),
imshow(RGB);
stats = graycoprops(glcm, {'contrast','homogeneity','correlation', 'energy'});
STATS = graycoprops(GLCM, {'contrast','homogeneity','correlation', 'energy'});
