A = [1,0,0,0,1,1];
n = 6;
k = ((2^n)-1);
v = zeros(k,1);

for i=1:k
    v(i)=A(6);
    A(6)=A(5);
    A(5)=A(4);
    A(4)=A(3);
    A(3)=A(2);
    A(2)=A(1);
    A(1)=xor(A(4),A(5));
end