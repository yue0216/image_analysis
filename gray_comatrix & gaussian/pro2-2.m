im=double(rgb2gray(imread('lena1.jpg')));
imagesc(im);
colormap gray;
axis off;
axis image;
DoG=fspecial('gaussian',15,25)-fspecial('gaussian',15,10);
imagesc(DoG)
surf(DoG)
ImageDog=imfilter(im,DoG,'symmetric','conv');
figure(1),
imagesc(ImageDog);
axis off;
axis image;