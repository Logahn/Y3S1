rgb = imread('coloredChips.png');
figure('Name','rgb')
imshow(rgb)

% ToDetermineCirleSize=1; % задать 0 или 1
% % Определить размеры кружков на изображении
% if ToDetermineCirleSize > 0
% title('Определите радиус кружков')
% d = imdistline;
% return
% end
% 
% delete(d)
% 
% gray_image = rgb2gray(rgb);
% figure('Name','gray_image')
% imshow(gray_image)
%  
% [centers,radii] = imfindcircles(rgb,[radiusMin radiusMax],'ObjectPolarity','dark');
% len_c= length(centers);
% 
% [centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark',...
% 'Sensitivity',0.9);
% 
% figure('Name','rgb_r1')
% imshow(rgb)
% h = viscircles(centers,radii);
% % 
% [centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark',...
% 'Sensitivity',0.92);
% length(centers)

% imshow(rgb)
% h = viscircles(centers,radii);
% 
% 
% [centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark',...
% 'Sensitivity',0.92,'Method','twostage');
% imshow(rgb)
% h = viscircles(centers,radii);
% 
% [centers,radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.95);
% imshow(rgb)
% viscircles(centers,radii);
% 
% imshow(gray_image)
% 
% [centersBright,radiiBright] = imfindcircles(rgb,[20 25], ...
% 'ObjectPolarity','bright','Sensitivity',0.92);
% 
% imshow(rgb)
% hBright = viscircles(centersBright, radiiBright,'Color','b');
% 
% [centersBright,radiiBright,metricBright] = imfindcircles(rgb,[20 25],...
% 'ObjectPolarity','bright','Sensitivity',0.92,'EdgeThreshold',0.1);
% imshow(rgb)
% hBright = viscircles(centersBright, radiiBright,'Color','b');
% 
% h = viscircles(centers,radii);




















