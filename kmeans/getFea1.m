function [fea] = getFea1(image)
image = rgb2gray(image);
[m,n]=size(image);
len = m*n;
x=reshape(image,len,1);
bins = linspace(0,255,128);
xpdf=hist(x,bins);

fea=xpdf;

end