N=1000000;
m=0;
d=[0.1,1.0,10];
hold on;
for j=1:3
    X=randn(N,1)*sqrt(d(j))+m;
    M=0;
    M2=0;
    for i=1:N
        M=M+(1/N)*X(i);
        M2=M2+(1/N)*X(i)*X(i);
    end
    D=M2-(M*M);
    sigma=sqrt(D);
    a=M;
    X=sort(X);
    fx=(1/(sigma*sqrt(2*pi)))*exp(-((X-a).^2)/(2*sigma^2));
    plot(X,fx);
end
hold off;