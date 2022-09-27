businessCard = imread('/home/logan/github/Y3S1/Image recognition methods/Labwork 2/business_card1.png');
% ocrResults = ocr(businessCard, 'Language','/home/logan/github/Y3S1/Image recognition methods/Labwork 2/myLang2/tessdata/myLang.traineddata');
ocrResults = ocr(businessCard);
name_locator = locateText(ocrResults,'Adele Chinda', 'IgnoreCase', true);
image1 = insertShape(businessCard, 'FilledRectangle', name_locator);
figure; 
imshow(image1);

job_locator = locateText(ocrResults, 'software engineer', 'IgnoreCase', true);
image2 = insertShape(businessCard, 'FilledRectangle', job_locator);
figure; 
imshow(image2);

businessCard = imread('business_card1.png');
ocrResults = ocr(businessCard);
Iocr = insertObjectAnnotation(businessCard, 'rectangle', ...
ocrResults.WordBoundingBoxes, ...
ocrResults.Words);
figure; imshow(Iocr);