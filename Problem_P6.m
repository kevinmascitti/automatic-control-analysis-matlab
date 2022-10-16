clear all
clc
close all

nu=1;
Gs=3;
Gf=1/9;
Ga=-0.27;
s=tf('s');
Gp=40/(s^3+3*s^2+4.5*s);
Kc=-0.05*10^(3.5/20)

Lin=(Kc/s^nu)*Gs*Gf*Ga*Gp;

Tp=1.03;
Sp=1.34;

wcdes=1.5;

figure(1)
[nLin,dLin]=tfdata(Lin,'v');
nyquist1(nLin,dLin);

figure(2)
myngridst(Tp,Sp);
nichols(Lin);

% rete zero
wcnormz=30;
z=wcdes/wcnormz;
Rz=1+s/z;

% rete lead
wcnormd1=1;
zd1=wcdes/wcnormd1;
md1=16;
Rd1=(1+s/zd1)/(1+s/(md1*zd1));

L=(Kc/s^nu)*Gs*Gf*Ga*Gp*Rz*Rd1;
nichols(L);

figure(3)
T=L/(1+L);
step(T/(Gf*Gs));
S=1/(1+L);

[m1,f1]=bode(T,50)
20*log(m1)
