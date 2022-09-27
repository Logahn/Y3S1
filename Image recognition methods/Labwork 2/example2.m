% Загрузить изображение
I = imread('businessCard.png');
% Выполнить OCR
results = ocr(I);
% Отображение одного из распознанных слов (2го)
word = results.Words{2};
% Расположение слова на изображении I
wordBBox = results.WordBoundingBoxes(2,:);
% Показать расположение слова в исходном изображении.
figure;
Iname = insertObjectAnnotation(I,'rectangle',wordBBox,word);
imshow(Iname);
