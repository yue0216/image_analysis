%% train
close all;
clc;
load facedata.mat; 
facepixel = []; 
for i=1:length(idx)
    im = imread(['train\',trainfile{i}]); 
    facepixel = [facepixel,im(:)]; 
end
facepixel = double(facepixel); 
mean_face = mean(facepixel,2); 
newFace = facepixel - repmat(mean_face,1,40); 
covariance = cov(newFace);
[V,D] = eig(covariance);
 
eigenVector = facepixel*V;
figure;
for i = 2:2:40          
subplot(4,5,(i)/2);     
    imshow(reshape(eigenVector(:,i),112,92));
end;
 
 
eigFea = eigenVector'*facepixel;    
disp('train finished!');
%% test
imagepath = 'test\';
imagegroup = dir([imagepath '*.pgm']);
figure;
for i = 1 : length(imagegroup)
    teimg = imread([imagepath,imagegroup(i).name]);
tefea = double(teimg(:));
te_eig_fea = eigenVector'*tefea;   
 
dis = pdist2(eigFea',te_eig_fea');
[C,I] = min(dis);         
people = idx(I);
subplot(3,4,i);
imshow(teimg);
title(['People id is: ',num2str(people)]);
end;
