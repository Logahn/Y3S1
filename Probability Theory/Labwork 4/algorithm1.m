N=1000000;
X=randn(N,1);
xn=X;
hist(xn,100);
a=0;
b=0;
c=0;

for i=1:N-1
    if(xn(i)<1&&xn(i)>-1)
        a=a+1;
        b=b+1;
        c=c+1;
    elseif(xn(i)<2&&xn(i)>-2)
        b=b+1;
        c=c+1;
    else
        c=c+1;
    end
end
fprintf ('\nMathematical expectation generator algorithm %f', sum(xn)/N);
fprintf ('\nVariance %f', var(xn));
fprintf ('\nSigma 1 %f',(a/(N))*100);
fprintf ('\nSigma 2 %f',(b/(N))*100);
fprintf ('\nSigma 3 %f',(c/(N))*100);
