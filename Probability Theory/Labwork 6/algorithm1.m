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
dis=zeros(1,N);
lambda=10;
for i=1:N-1
    dis(i) = -1*(log(1-U(i))*lambda);
end
hist(dis, 1000);
mat_ozh=0;
mat_ozh2=0;
for i=1:N
    mat_ozh=mat_ozh+(1/N)*dis(i);
    mat_ozh2=mat_ozh2+(1/N)*dis(i)*dis(i);
end
disps=mat_ozh2-(mat_ozh*mat_ozh);
W=['Mathematical expectation:',num2str(mat_ozh)];
disp(W);
Q=['Variance:', num2str(disps)];
disp(Q);





















