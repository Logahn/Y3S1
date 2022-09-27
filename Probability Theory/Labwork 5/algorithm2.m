Lambda=0.8;
K=25;
for k=1:1:4;
    Kk=K*k;
    for x=1:1:250;
        P1(k,x)=((L*x).^Kk)/(factorial(Kk)).*exp(-L*x);
    end;
end;
figure(2)
hold on
plot(P1(1,:));
plot(P1(2,:));
plot(P1(3,:));
plot(P1(4,:));
hold off