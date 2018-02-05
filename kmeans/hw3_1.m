clc;clf;clear all;
imagepath='E:\Study\Class\¥Û»˝…œ\ImageAnalysis2014\slides\homework3\homework3\';
imagename = {'class2/n02898711_36.JPEG','class2/n02898711_63.JPEG','class2/n02898711_910.JPEG','class2/n02898711_1102.JPEG'...
            'class3/n02802426_273.JPEG','class3/n02802426_582.JPEG','class3/n02802426_4345.JPEG','class3/n02802426_225.JPEG'...
            'class4/n13111881_355.JPEG','class4/n13111881_757.JPEG','class4/n13111881_808.JPEG','class4/n13111881_845.JPEG'}
        
        
imFeas=[];
for i = 1:length(imagename)
    image = imread([imagepath,imagename{i}]);
    imagefea = getFea1(image);
    imFeas = [imFeas;imagefea];
end
opts = statset('Display','iter');
[IDX,C]=kmeans(imFeas,3,'Options',opts);

figure(1),title('cluster 1'),
subplot(2,1,1),imshow([imagepath,imagename{5}]);
subplot(2,1,2),imshow([imagepath,imagename{7}]);


figure(2),title('cluster 2'),
subplot(3,3,1), imshow([imagepath,imagename{1}]);
subplot(3,3,2), imshow([imagepath,imagename{2}]);
subplot(3,3,3), imshow([imagepath,imagename{3}]);
subplot(3,3,4), imshow([imagepath,imagename{4}]);
subplot(3,3,5), imshow([imagepath,imagename{8}]);
subplot(3,3,6), imshow([imagepath,imagename{9}]);
subplot(3,3,7), imshow([imagepath,imagename{10}]);
subplot(3,3,8), imshow([imagepath,imagename{11}]);
subplot(3,3,9), imshow([imagepath,imagename{12}]);


figure(3),
imshow([imagepath,imagename{6}]);
title('cluster 3');