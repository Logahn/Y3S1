% A = imread('circlesBrightDark.png');
A = imread('/home/logan/github/Y3S1/Image recognition methods/Labwork 4/image_recog.png');

imshow(A)
Rmin = 25;
Rmax = 65;

[centersBright, radiiBright] = imfindcircles(A,[Rmin
Rmax],'ObjectPolarity','bright');
[centersDark, radiiDark] = imfindcircles(A,[Rmin
Rmax],'ObjectPolarity','dark');
viscircles(centersBright, radiiBright,'Color','b','LineStyle',':');
viscircles(centersDark, radiiDark,'LineStyle','--','Color','r');