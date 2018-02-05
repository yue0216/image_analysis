function [y0,tr,ypdf,xpdf]=histeq(x0,L,mode)
% Usage: [y0,tr,ypdf,xpdf]=histeq(x0,L,mode)
% histogram equalization algorithm
% (C) 2002 by Yu Hen Hu
% created: 12/18/2006
%
% x0: M x N input image, each pixel has L levels
% y0: histogram equalized image, each pixel has L levels
% L: [0:L-1] # of gray levels. default L = 256
% tr: histogram transformation
% xpdf, ypdf: histogram of x0 and y0
% mode = 0: default, do not plot figures
%      = 1: plot figures
% 
% Algorithm:
% 1. compute the PDF, and then CDF (T(r))of x0
% 2. point-wise gray-level transform according to T(r)
 
if nargin<3, mode=0; end % default not plotting figures
if nargin<2, L=256; end  % default L=256
 
bins=[0:L-1];
[m,n]=size(x0); 
len=m*n;
x=reshape(x0,len,1); %形状改成25000*1
xpdf=hist(x,bins); % pdf, 1 x L %做直方图
tr=round(xpdf*triu(ones(L))*(L-1)/len);  % cdf, range from 0 to L-1 均衡化
 
%%cdf=xpdf*triu(ones(L));
%%tr=round((cdf-min(cdf))/(len-min(cdf))*(L-1))

y0=zeros(m,n); %尺寸和x相同的全0矩阵
for i=1:L,
   if xpdf(i)>0,
      y0=y0+[x0==i-1]*tr(i); 
   end
end
ypdf=hist(reshape(y0,len,1),[0:L-1]); % pdf of y, 1 x L 均衡化后图像
 
if mode==1, 
   figure(1),
   subplot(211),stem([0:L-1],xpdf),title('histogram, original')
   axis([0 256 0 500])
   subplot(212),stem([0:L-1],ypdf),title('histogram, equalized'),
   axis([0 256 0 500])
   figure(2),
   stairs([0:L-1],tr),title('transformation'),
   axis([0 256 0 256])
   figure(3),subplot(121),imagesc(uint8(x0)),title('before'),colormap('gray')
   subplot(122),imagesc(uint8(y0)),title('after'),colormap('gray')
end

