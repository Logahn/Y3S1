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
% Найти символы с низкой достоверностью.
lowConfidenceIdx = results.CharacterConfidences < 0.5;
% Получить место ограничительной рамки низкой достоверности символов.
lowConfBBoxes = results.CharacterBoundingBoxes(lowConfidenceIdx, :);
% Получить значения характеристик.
lowConfVal = results.CharacterConfidences(lowConfidenceIdx);
% Пометить изображения с символами .
str = sprintf('confidence = %f', lowConfVal);
Ilowconf = insertObjectAnnotation(I,'rectangle',lowConfBBoxes,str);
figure;
imshow(Ilowconf);