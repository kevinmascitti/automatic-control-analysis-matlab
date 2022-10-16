clear all
close all
clc

s=tf('s');
Gs=1;
Gf=1;
Ga=0.014;
Gp=100/(s^2+5.5*s+4.5);
nu=1;

Kd=1;
Kc=22*10^(-9.1/20);
Tp=1.05;
Sp=1.55;
Lin=(Kc/s^nu)*Ga*Gf*Gs*Gp;

figure(1)
[nLin,dLin]=tfdata(Lin,'v');
nyquist1(nLin,dLin)

wcdes=1.7;

% progetto rete zero
wnorm_z=1.1;
z=wcdes/wnorm_z;
Rz=1+s/z;

L=(Kc/s^nu)*Ga*Gf*Gs*Gp*Rz;
figure(2)
myngridst(Tp,Sp)
nichols(Lin)
nichols(L)

% step response
T=minreal(zpk(L/(1+L)));
S=minreal(zpk(1/(1+L)));
figure(3)
step(T/(Gf*Gs),15)

[m1,f1]=bode(T,60);
20*log10(m1)
[m2,f2]=bode(S,0.03);
20*log10(m2)

