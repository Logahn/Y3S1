figure
colors = {'b','r','g','y','k'};
for k = 1:5
% Create 5 random circles to display,
X = rand(5,1);
Y = rand(5,1);
centers = [X Y];
radii = 0.1*rand(5,1);
% Clear the axes.
cla
% Fix the axis limits.
xlim([-0.1 1.1])
ylim([-0.1 1.1])
% Set the axis aspect ratio to 1:1.
axis square
% Set a title.
title(['k = ' num2str(k)])
% Display the circles.
viscircles(centers,radii,'Color',colors{k});
% Pause for 1 second.
pause(1)
end