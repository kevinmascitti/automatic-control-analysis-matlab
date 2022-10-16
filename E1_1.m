% 1 es 1
clear all
clc
close all

R=1000; % se aumenta, vengono smorzate le oscillazioni altrimenti aumentano
L=2e-3;
Ca=5e-6;

A=[-R/L -1/L; 1/Ca 0];
B=[1/L 0]';
C=[0 1];
D=0;
G=ss(A,B,C,D);

% punto 1
H=tf(G);
s=tf('s');
U1=3/s;
Y=H*U1;
Y=zpk(Y);

[numY,denY]=tfdata(Y,'v'); % uso la v per vederli come vettori (forma voluta da residue)
[r1,p1]=residue(numY,denY);

tao1=abs(1/real(p1(1)));
tao2=abs(1/real(p1(2)));
taomin=min(tao1,tao2);
taomax=max(tao1,tao2);
t=[0:taomin/100:10*taomax];
y=r1(1)*exp(p1(1)*t)+r1(2)*exp(p1(2)*t)+r1(3);

figure(1)
step(H*3) % step plotta la fdt, risposta al gradino di ampiezza 3
hold on
plot(t,y,'or')

% punto 2
U2=50/(s^2+25);
x0=[1 3]';
X=inv(s*eye(2)-A)*x0+inv(s*eye(2)-A)*B*U2;
X=minreal(zpk(X),1e-4) % se inserisco la tolleranza riesce a forzare le semplificazioni

X1=X(1);
[numX1,denX1]=tfdata(X1,'v');
[r2,p2]=residue(numX1,denX1);
% poli reali -> residui reali

x1=2*abs(r2(1))*exp(real(p2(1))*t).*cos(imag(p2(1))*t+angle(r2(1)))+2*abs(r2(3))*cos(imag(p2(3))*t+angle(r2(3)));

figure(2)
plot(t,x1)

figure(3)
plot(t,2*abs(r2(3))*cos(imag(p2(3))*t+angle(r2(3))))
% non lo vedo perché prendo intevallo di tempo troppo
% piccolo in quanto w=5 -> f=w/(2pi) -> T=1/f=1,25s
% allora espando l'orizzonte temporale di taomax

% punto 3
autA=eig(A) 
