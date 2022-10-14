% RGB = imread('tape.png');
% imshow(RGB);
% hTxt = text(15,15,'Estimate radius of the roll of tape','FontWeight','bold','Color','y');
% 
% Rmin = 60;
% Rmax = 100;
% [center, radius] = imfindcircles(RGB,[Rmin Rmax],'Sensitivity',0.9)
% 
% imshow(RGB);
% % Display the circle
% viscircles(center,radius);
% % Display the calculated center
% hold on;
% plot(center(:,1),center(:,2),'yx','LineWidth',2);
% hold off;
% message = sprintf('The estimated radius is %2.1f pixels', radius);
% text(15,15,message,'Color','y','FontWeight','bold');


RGB = imread('tape.png');
imshow(RGB);

hTxt = text(15,15,'Estimate radius of the roll of tape',...
     'FontWeight','bold','Color','y');
Rmin = 60; 
Rmax = 100;
[center, radius] = imfindcircles(RGB,[Rmin Rmax],'Sensitivity',0.9)
% Display the circle
viscircles(center,radius);

% Display the calculated center
hold on;
plot(center(:,1),center(:,2),'yx','LineWidth',2);
hold off;

delete(hTxt);
message = sprintf('The estimated radius is %2.1f pixels', radius);
text(15,15,message,'Color','y','FontWeight','bold');