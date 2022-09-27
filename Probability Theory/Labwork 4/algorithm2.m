N=1000000;
X1=randn(N,1)-5;
X2=randn(N,1)+5;
X3=randn(N,1)+10;
figure;
histogram (X1, 100)
title ('математического ожидания равные -5')
figure;
histogram (X2, 100)
title ('математического ожидания равные 5')
figure;
histogram (X3, 100)
title ('математического ожидания равные 10')
fprintf (' \nMathematical expectation for -5:  %f \n Дисперсия= %f', sum(X1),var(X1));
fprintf (' \nMathematical expectation for 5: %f \n Дисперсия= %f', sum(X2),var(X2));
fprintf (' \nMathematical expectation for 10: %f \n Дисперсия= %f', sum(X3),var(X3));