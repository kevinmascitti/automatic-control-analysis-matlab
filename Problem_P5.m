clear all
clc
close all

s=tf('s');
Gp=25/(s^3+3.3*s^2+2*s);
Gs=2;
Gf=1/8;
Ga=0.38;
Kc=0.05*10^(-11/20);
nu=1;

Tp=1.08;
Sp=1.39;
wcmin=0.795;
wcmax=1;

wcdes=0.9;

Lin=(Kc/s^nu)*Ga*Gf*Gs*Gp;

figure(1)
[nLin,dLin]=tfdata(Lin,'v');
nyquist1(nLin,dLin);

% rete zero
wnormz=50;
z=wcdes/wnormz;
Rz=(1+s/z);

% rete lead
wnormd=1;
md=16;
zd=wcdes/wnormd;
Rd=(1+s/zd)/(1+s/(md*zd));

L=(Kc/s^nu)*Ga*Gf*Gs*Gp*Rz*Rd;

figure(2)
myngridst(Tp,Sp);
nichols(Lin);
nichols(L);

figure(3)
T=minreal(zpk(L/(1+L)));
step(T/(Gf*Gs))
S=minreal(zpk(1/(1+L)));

[m1,f1]=bode(T,40);
20*log10(m1)
[m2,f2]=bode(S,0.02);
20*log10(m2)



