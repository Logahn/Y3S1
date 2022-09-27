N=1000000;
a=881627121;
c=26586512;
m=31037700;
Y=ones(1,N);
U=zeros(1,N);
for i=1:N-1
    Y(i+1)=rem((a*Y(i)+c),m);
    U(i)=Y(i)/m;
end
res1=zeros(1,N);
lambda=10;
jk=0;
for i=1:N-1
    res1(i)=-1*(log(1-U(i))*lambda);
    jk=jk+res1(i);
end
hist(res1, 1000);
mat_ozh=0;
mat_ozh2=0;
for i=1:N
    mat_ozh=mat_ozh+(1/N)*res(i);
    mat_ozh2=mat_ozh2+(1/N)*res(i)*res(i);
end
Tell=['Total time of СМО work: ',num2str(jk)];
disper=mat_ozh2-(mat_ozh*mat_ozh);
E=['Mathematical expectation: ',num2str(mat_ozh)];
disp(E);
Q=['Variance: ',num2str(disper)];
n=500;
jk=jk/n;
S=['Interval length: ',num2str(jk)];
disp(Q);
disp(Tell);
disp(S);