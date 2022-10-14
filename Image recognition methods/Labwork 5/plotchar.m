% % code
function plotchar(c)
%PLOTCHAR Plot a 35 element vector as a 5x7 grid.
%
%  PLOTCHAR(C)
%    C - a 35 element vector.
%  C's elements are plotted as a 5x7 grid.
% Mark Beale, 12-15-93
% Copyright 1992-2002 The MathWorks, Inc.
% $Revision: 1.11 $  $Date: 2002/04/14 21:23:48 $
% DEFINE BOX
x1 = [-0.5 -0.5 +0.5 +0.5 -0.5];
y1 = [-0.5 +0.5 +0.5 -0.5 -0.5];
% DEFINE BOX WITH X
x2 = [x1 +0.5 +0.5 -0.5];
y2 = [y1 +0.5 -0.5 +0.5];
newplot;
plot(x1*5.6+2.5,y1*7.6+3.5,'m');
axis([-1.5 6.5 -0.5 7.5]);
axis('equal')
axis off
hold on
for i=1:length(c)
    x = rem(i-1,5)+.5;
    y = 6-floor((i-1)/5)+.5;
    plot(x2*c(i)+x,y2*c(i)+y);
end
hold off
end

% code
function [alphabet,targets] = prprob()
%PRPROB Character recognition problem definition
%  [ALHABET,TARGETS] = PRPROB()
letterA =  [0 1 1 1 1 1 1 1 0 ...
    0 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1]';
letterB =  [ 1 1 1 1 1 1 1 1 0 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 0]';
letterC =  [0 1 1 1 1 1 1 1 0 ...
    0 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 1 1 1 1 1 1 0 ...
    0 1 1 1 1 1 1 1 0]';
letterD =  [1 1 1 1 1 1 1 1 0 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 1 1 1 1 1 1 0]';
letterE =  [1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 1]';
letterF =  [1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0]';
letterG =  [0 1 1 1 1 1 1 1 0 ...
    0 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 1 1 1 1 1 ...
    1 1 0 0 1 1 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    0 1 1 1 1 1 1 1 0]';
letterH =  [1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1]';
letterI =  [0 0 1 1 1 1 1 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 1 1 1 1 1 0 0]';
letterJ =  [0 0 0 0 0 0 1 1 1 ...
    0 0 0 0 0 0 1 1 1 ...
    0 0 0 0 0 0 1 1 1 ...
    0 0 0 0 0 0 1 1 1 ...
    0 0 0 0 0 0 1 1 1 ...
    0 0 0 0 0 0 1 1 1 ...
    0 0 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    0 1 1 1 1 1 1 1 0]';
letterK =  [1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 1 1 1 0 ...
    1 1 0 0 1 1 0 0 0 ...
    1 1 1 1 1 1 0 0 0 ...
    1 1 1 1 1 1 0 0 0 ...
    1 1 0 0 1 1 0 0 0 ...
    1 1 0 0 1 1 1 1 0 ...
    1 1 0 0 0 1 1 1 0 ...
    1 1 0 0 0 0 1 1 1]';
letterL =  [1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 1 1 1 1 1 1 0]';
letterM =  [1 1 0 0 0 0 0 1 1 ...
    1 1 1 0 0 0 1 1 1 ...
    1 1 1 0 0 0 1 1 1 ...
    1 1 1 1 0 1 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 0 1 1 1 0 1 1 ...
    1 1 0 0 1 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1]';
letterN =  [1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 1 0 0 0 0 1 1 ...
    1 1 1 1 0 0 0 1 1 ...
    1 1 1 1 1 1 0 1 1 ...
    1 1 0 1 1 1 1 1 1 ...
    1 1 0 0 0 1 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1]';
letterO =  [0 1 1 1 1 1 1 1 0 ...
    0 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    0 1 1 1 1 1 1 1 0]';
letterP =  [1 1 1 1 1 1 1 1 0 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 0 0 0 0 0 0 0]';
letterQ =  [0 1 1 1 1 1 1 1 0 ...
    0 1 1 1 1 1 1 1 0 ...
    1 1 1 0 0 0 1 1 1 ...
    1 1 1 0 0 0 1 1 1 ...
    1 1 1 0 0 0 1 1 1 ...
    1 1 1 0 0 0 1 1 1 ...
    1 1 1 0 0 0 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    0 1 1 1 1 1 1 1 0 ...
    0 0 0 0 0 0 1 1 1]';
letterR =  [1 1 1 1 1 1 1 1 0 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 0 0 1 1 1 0 0 ...
    1 1 0 0 0 1 1 0 0 ...
    1 1 0 0 0 1 1 1 0 ...
    1 1 0 0 0 0 1 1 1]';
letterS =  [0 1 1 1 1 1 1 1 0 ...
    1 1 1 1 1 1 1 1 0 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 0 0 0 ...
    1 1 1 1 1 1 1 1 0 ...
    0 1 1 1 1 1 1 1 1 ...
    0 0 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    1 1 0 0 0 0 1 1 1 ...
    0 1 1 1 1 1 1 1 0]';
letterT =  [1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0]';
letterU =  [1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    0 1 1 1 1 1 1 1 0]';
letterV =  [1 0 0 0 0 0 0 0 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 0 0 0 0 0 1 1 ...
    1 1 1 0 0 0 1 1 1 ...
    0 1 1 0 0 0 1 1 0 ...
    0 1 1 1 0 1 1 1 0 ...
    0 0 1 1 1 1 1 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 0 1 0 0 0 0]';
letterW =  [1 1 0 1 1 1 0 1 1 ...
    1 1 0 1 1 1 0 1 1 ...
    1 1 0 1 1 1 0 1 1 ...
    1 1 0 1 1 1 0 1 1 ...
    1 1 0 1 1 1 0 1 1 ...
    1 1 0 1 1 1 0 1 1 ...
    1 1 0 1 1 1 0 1 1 ...
    1 1 0 1 1 1 0 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    0 1 1 1 0 1 1 1 0]';
letterX =  [1 1 0 0 0 0 0 1 1 ...
    1 1 1 0 0 0 1 1 1 ...
    0 1 1 1 0 1 1 1 0 ...
    0 0 1 1 1 1 1 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 1 1 1 1 1 0 0 ...
    0 1 1 1 0 1 1 1 0 ...
    1 1 1 0 0 0 1 1 1 ...
    1 1 0 0 0 0 0 1 1]';
letterY =  [1 1 0 0 0 0 0 1 1 ...
    1 1 1 0 0 0 1 1 1 ...
    0 1 1 0 0 0 1 1 0 ...
    0 1 1 1 1 1 1 1 0 ...
    0 0 1 1 1 1 1 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 0 0 1 1 1 0 0 0]';
letterZ =  [1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 1 ...
    0 0 0 0 0 0 1 1 1 ...
    0 0 0 0 0 1 1 1 1 ...
    0 0 0 0 1 1 1 1 0 ...
    0 0 0 1 1 1 0 0 0 ...
    0 1 1 1 1 0 0 0 0 ...
    1 1 1 1 0 0 0 0 0 ...
    1 1 1 1 1 1 1 1 1 ...
    1 1 1 1 1 1 1 1 1]';
alphabet = [letterA,letterB,letterC,letterD,letterE,letterF,letterG,letterH,...
    letterI,letterJ,letterK,letterL,letterM,letterN,letterO,letterP,...
    letterQ,letterR,letterS,letterT,letterU,letterV,letterW,letterX,...
    letterY,letterZ];
targets = eye(26);
end


