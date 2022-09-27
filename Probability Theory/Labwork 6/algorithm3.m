N=10000000;
a=88162;
c=26582;
m=31037700567;
x=zeros(N,1);
U=zeros(N,1);
for i=1:N
 x(i+1)=mod((a*x(i)+c),m);
 U(i)=x(i)/m;
end
mat_ozh=sum(U)/N;
dis=zeros(N,1);
for i=1:N
 b=1/N;
 dis(i)=(U(i)-mat_ozh)^2;
end 
%disp(Mx);
Dx=sum(dis)/N;
%disp(Dx);
M=zeros(N,1);
for j=1:N
 M(j)=-2*log(1-U(j));
end
mat_ozh2=sum(M)/N;
dis2=zeros(N,1);
for i=1:N
 b=1/N;
 dis2(i)=(M(i)-mat_ozh2)^2;
end
dis2=sum(dis2)/N;
histogram (M,1000);
T=0;
for i=1:N
 T=T+M(i);
end
g=T/100000;
k=zeros(100000,1);
pl=0;
pt=0;
j=1;
for i=1:100000
 while(pl<(g*i))
  pl=pl+M(j);
  j=j+1;
  pt=pt+1;
 end
 k(i)=pt;
 pt=0;
end
mat_ozh3=sum(k)/100000;
dis3=zeros(100000,1);
for i=1:100000
 b=1/100000;
 dis3(i)=(k(i)-mat_ozh3)^2;
end
fprintf (' \nMathematical Expectation %f',mat_ozh3);
dis3=sum(dis3)/100000;
fprintf (' \nVariance %f', dis3);
histogram(k,90);
