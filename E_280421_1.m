clear all
close all
T=1;
z=tf('z',T);
A=[3 0; -3.5 -0.5];
n=size(A,1);
B=[1;2];
C=[1 -1];
D=0;
U=2*z/(z-1);
x0=[1; -2];

Q=inv(z*eye(n)-A);

X=zpk(minreal(Q*(z*x0+B*U),1e-3));
Y=zpk(minreal(C*X+D*U,1e-3));

Xtilde=minreal(X/z,1e-3);
[num,den]=tfdata(Xtilde(1),'v');
[r,p]=residue(num,den)
[num,den]=tfdata(Xtilde(2),'v');
[r,p]=residue(num,den)