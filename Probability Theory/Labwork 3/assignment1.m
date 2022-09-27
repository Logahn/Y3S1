n = 1000000;
a = 16821;
c = 56210;
m = 123679291211;
lamda = 10;
x=zeros(n,1);
U=zeros(n,1);
for i =1:n
    x(i+1)=rem((a*x(i)+c),m);
    U(i)=x(i)/m;
end
M=sum(U)/n;
V=zeros(n,1);
for k=1:n
    V(k)=(U(k)-M).^2;
end
D=sum(V)/n;
R=zeros(n,1);
for j=1:n
    R(j)=-lamda*log(1-U(j));
end
fprintf('\nAlgorithm 1:')
fprintf (' \nMathematical expectation 1 generator algorithm %f', mean (U));
fprintf (' \nVariance 1 algorithm %f',var (U));
fprintf('\nAlgorithm 2:')
fprintf (' \nMathematical expectation 2 generator algorithm %f', mean (R));
fprintf (' \nVariance 2 algorithm %f',var (R));
figure;
hist(R,100);
title ('Экспоненциальный алгоритм')
figure;
hist(U,100);
title ('Алгоритм умножения')