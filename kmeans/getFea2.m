function [fea] = getFea2(image)
image = rgb2gray(image);

glcom = graycomatrix(image);
cofea = graycoprops(glcom);
fea=[cofea.Contrast,cofea.Correlation,cofea.Energy,cofea.Homogeneity];

end