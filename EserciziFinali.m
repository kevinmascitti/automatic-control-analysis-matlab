%% 1
clc
close all
clear all

A=[0 -1; 3 -2];
B=[1;1];
C=[1 1];
D=0;
G=ss(A,B,C,D);
H=minreal(zpk(G));
s=tf('s');
u=5/s;
y=H*u;
[Ny,Dy]=tfdata(y,'v');
[R,P]=residue(Ny,Dy);

%% 2
A=[0 -1; 3 -2];
B=[1;1];
C=[1 1];
D=0;
Co=ctrb(A,B);
r=rank(Co);
% siccome r=2=n il sist è completamente controllabile
K=place(A,B,[20 -10])

%% Esame 9/2/21

A=[0 -1; 3 -2];
B=[1;1];
C=[1 1];
D=0;

M=ctrb(A,B);
rank(M)
K=place(A,B,[20 -10])

eig([-1 1; 0 2])

A=[0 -1; 3 -2];
B=[1;1];
C=[1 1];
D=0;
s=tf('s');
U=5/s;
H=C*(s*eye(2)-A)^(-1)*B+D;
Y=minreal(zpk(H*U),1e-2)
[num,den]=tfdata(Y,'v');
[R,P,K]=residue(num,den)

A=[3 0; 0 0.7];
B=[1;1];
C=[0 3];
D=0;
s=tf('s');
H=C*(s*eye(2)-A)^(-1)*B+D;
H=minreal(zpk(H),1e-3)
U=1/s;

A=[0 -1; 3 -2];
B=[0;0];
C=[1 1];
D=0;
H=C*(s*eye(2)-A)^(-1)*B+D
M=obsv(A,C);
rank(M)
L=place(A',C',[-10 -20])'
eig(A-L*C)

A=[0 -1; 3 -2];
B=[1;1];
C=[1 1];
D=0;
M=ctrb(A,B);
rank(M)
K=place(A,B,[20, -10])

A=[0 -1; 3 -2];
B=[1;1];
C=[1 1];
D=0;
U=5/s;
H=C*(s*eye(2)-A)^(-1)*B+D
Y=minreal(zpk(H*U),1e-2)
[num,den]=tfdata(Y,'v');
[R,P,K]=residue(num,den)

A=[3 0; 0 0.7];
B=[1;1];
C=[0 3];
D=0;
H=C*inv(s*eye(2)-A)*B+D
U=1/s;
Y=minreal(zpk(U*H))
[n,d]=tfdata(Y,'v');
[R,P,K]=residue(n,d)

A=[2 0; 0 1];
B=[1;5];
C=[0 1];
D=0;
M=obsv(A,C)
rank(M)

A=[-1 5; 3 1];
B=[7;-3];
C=[2 -5];
D=-4;
x0=[-2 -1];
Y=minreal(zpk(C*inv(s*eye(2)-A)*x0'),1e-3)
[n,d]=tfdata(Y,'v');
[R,P,K]=residue(n,d)

A=[0 1 0 0; -0.22 -1.3 0 0; 0 0.5 0 1; 0.2 1 -0.04 -0.5]
eig(A)

G=(s-2)/((s+1)*(s+5));
[m,f]=bode(G,4)
5*m

A=[0 0.5; 1 -0.5];
B=[1;-1];
C=[0 3];
D=0;
H=minreal(zpk(C*inv(s*eye(2)-A)*B+D))

A=[-6 0 -5; 4 1 5; 6 0 6];
B=[0;1;0];
C=[0 1 0];
D=0;
Mc=ctrb(A,B);
rank(Mc)
Mo=obsv(A,C);
rank(Mo)

A=[3 0; 0 0.7];
B=[1;1];
C=[0 3];
D=0;
z=tf('z');
H=C*inv(z*eye(2)-A)*B+D
U=1/(1-z^(-1));
Y=minreal(zpk(U*H))
Yt=Y/z
[n,d]=tfdata(Yt,'v');
[R,P,K]=residue(n,d)