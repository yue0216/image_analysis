grayimage=double(imread('Fig0.tif'));
[dx,dy] = gradient(grayimage); 
gradmag = (abs(dx) + abs(dy))/2;
figure(1);
imagesc(gradmag);
colorbar;
title('Gradient magnitude at every pixel');
