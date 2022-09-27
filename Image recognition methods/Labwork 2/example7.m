I = imread('keypad.jpg');
I = rgb2gray(I);
figure;
imshow(I)

%============================================
% No output due to wrong background
%============================================

% Run OCR on the image
results = ocr(I);
results.Text

% Set 'TextLayout' to 'Block' to instruct ocr to assume the image
% contains just one block of text.
results = ocr(I,'TextLayout','Block');
results.Text

%============================================
% Binarize function is used to check the first
% step of binarization function
% 1st image
%============================================
% 
% BW = imbinarize(I);
% figure;
% imshowpair(I,BW,'montage');

%============================================
% Binarize function didnt work fine so we 
% use preprocessing technique to imporve segmentation
% 2nd Image
%============================================

% Remove keypad background.
% Icorrected = imtophat(I,strel('disk',15));
% BW1 = imbinarize(Icorrected);
% figure;
% imshowpair(Icorrected,BW1,'montage');


%============================================
% Perform morphological reconstruction to 
% remove artifacts and make image cleaner
% 3rd Image
%============================================

% marker = imerode(Icorrected, strel('line',10,0));
% Iclean = imreconstruct(marker, Icorrected);
% BW2 = imbinarize(Iclean);
% figure;
% imshowpair(Iclean,BW2,'montage');

%============================================
% The locateText method seems a more efficient
% method
%============================================
% 
% The regular expression, '\d', matches the location of any digit in the
% recognized text and ignores all non-digit characters.
regularExpr = '\d';
% Get bounding boxes around text that matches the regular expression
bboxes = locateText(results,regularExpr,'UseRegexp',true);
digits = regexp(results.Text,regularExpr,'match');
% draw boxes around the digits

% Idigits = insertObjectAnnotation(I,'rectangle',bboxes,digits);
% figure;
% imshow(Idigits);

% To better the result, limit the ocr choices to  only digits
results = ocr(BW2, 'CharacterSet','0123456789','TextLayout','Block');
results.Text
% Sort the character confidences.
[sortedConf, sortedIndex] = sort(results.CharacterConfidences, 'descend');
% Keep indices associated with non-NaN confidences values.
indexesNaNsRemoved = sortedIndex( ~isnan(sortedConf) );
% Get the top ten indexes.
topTenIndexes = indexesNaNsRemoved(1:10);
% Select the top ten results.
digits = num2cell(results.Text(topTenIndexes));
bboxes = results.CharacterBoundingBoxes(topTenIndexes, :);
Idigits = insertObjectAnnotation(I,'rectangle',bboxes,digits);
figure;
imshow(Idigits);


% Initialize the blob analysis System object(TM).
blobAnalyzer = vision.BlobAnalysis('MaximumCount',500);
% Run the blob analyzer to find connected components and their statistics.
[area,centroids,roi] = step(blobAnalyzer,BW1);
% Show all the connected regions.
% img = insertShape(I,'rectangle',roi);
% figure;
% imshow(img);

areaConstraint = area > 300;
% Keep regions that meet the area constraint.
roi = double(roi(areaConstraint, :));
% Show remaining blobs after applying the area constraint.
% img = insertShape(I,'rectangle',roi);
% figure;
% imshow(img);


% Compute the aspect ratio.
width = roi(:,3);
height = roi(:,4);
aspectRatio = width ./ height;
% An aspect ratio between 0.25 and 1 is typical for individual characters
% as they are usually not very short and wide or very tall and skinny.
roi = roi( aspectRatio > 0.25 & aspectRatio < 1 ,:);
% Show regions after applying the area and aspect ratio constraints.
% img = insertShape(I,'rectangle',roi);
% figure;
% imshow(img);