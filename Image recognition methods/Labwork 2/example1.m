% businessCard = imread('businessCard.png');
% ocrResults = ocr(businessCard)
% recognizedText = ocrResults.Text;
% figure;
% imshow(businessCard);
% text(600, 150, recognizedText, 'BackgroundColor', [1 1 1]);



businessCard = imread('businessCard.png');
ocrResults = ocr(businessCard, 'Language','/home/logan/github/Y3S1/Image recognition methods/Labwork 2/myLang/tessdata/myLang.traineddata')
recognizedText = ocrResults.Text;
figure;
imshow(businessCard);
text(600, 150, recognizedText, 'BackgroundColor', [1 1 1]);


