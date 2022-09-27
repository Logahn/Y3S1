a = 897253;
c = 3453;
x = 34534534;
m = 4418;
n =  10000000;


a = 278358;
c = 6721;
x = 17818291;
m = 728;
n = 10000000;

%a = 3;
%c = 3;
%x = 5;
%m = 39
%n = 10000000;
 
% Creation of array
mas1 = [];
mas1 (1) = mod((a*x+c), m)/m;
% Algorithm for generating random variable 1
for i = 1 : n - 1
mas1(i+1) = mod((a*mas1(i)+c), m)/m;
end
% Result output
fprintf('\nAlgorithm 1:')
fprintf (' \nMathematical expectation 1 generator %f', mean (mas1));
fprintf (' \nVariance 1 generator %f',var (mas1));
% Histogram
figure;
histogram (mas1, 100)
title ('Algorithm 1')
 
% Creation of array
arr2 = [];
arr2 (1) = mod((x*x),m)/m;
% Algorithm for generating random variable 2
for i = 1 :n - 1
arr2 (i+1) = mod((x*arr2(i)), m)/m;
end
% Result output
fprintf('\nAlgorithm 2:')
fprintf (' \nMathematical expectation 2 generator %f', mean (arr2));
fprintf (' \nVariance 2 generator %f',var (arr2));
%Гистограмма
figure;
histogram (arr2, 100)
title ('Algorithm 2')
 
% Генерация с помощью встроенной ф-ии
arr3 = rand(n, 1);
% Вывод результатов
fprintf('\nInbuilt function:')
fprintf (' \n Mathematical expectation of in-built function%f', mean (arr3));
fprintf (' \nIn-built function variance %f',var (arr3));
% Гистограмма
figure;
histogram(arr3, 100)
title ('In-built function')
 