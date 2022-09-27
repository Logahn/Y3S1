Lambda = 1;
for k=1:1:10
    for x=1:1:100
        P(k,x)=((Lambda*x).^k)/(factorial(k)).*exp(-Lambda*x);
    end
end
figure(1)
hold on
plot(P(1,:));
plot(P(2,:));
plot(P(3,:));
plot(P(4,:));
plot(P(5,:));
plot(P(6,:));
plot(P(7,:));
plot(P(8,:));
plot(P(9,:));
plot(P(10,:));
hold off