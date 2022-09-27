I = imread('handicapSign.jpg');
%Задание одной или нескольких прямоугольных видимых областей
roi = [360 118 384 560];
%Можно также использовать IMRECT, чтобы выбрать область с помощью мыши:
figure; imshow(I); roi = round(getPosition(imrect))
ocrResults = ocr(I, roi);
%Вставка распознанного текста в оригинальное изображение
Iocr = insertText(I,roi(1:2),ocrResults.Text,'AnchorPoint',...
'RightTop','FontSize',16);
figure; imshow(Iocr);
