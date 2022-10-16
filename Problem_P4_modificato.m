clear all
clc
close all
s=tf('s');
Gp=-30/(s^3+3*s^2+2*s);
Ga=0.006;
Gs=1;
Kd=1;
Gf=1/(Kd*Gs);
nu=1;
Kc=-1*10^(-27.5/20); % abbassa di 25 dB
Lin=minreal(zpk(Kc/s*Gp*Ga*Gs*Gf));
figure(1)
[nLin,dLin]=tfdata(Lin,'v');
nyquist1(nLin,dLin)

Tp=1.13;
Sp=1.45;
figure(2)
myngridst(Tp,Sp)
nichols(Lin)

wcdes=0.8;

% rete zero
wnorm_zero=100;
z=wcdes/wnorm_zero;
Rz=(1+s/z);

% rete lead
wnorm_Rd=1.8;
zd=wcdes/wnorm_Rd;
md=3;
Rd=(1+s/zd)/(1+s/(md*zd));

% controllore
Gc=Kc/s^nu*Rz;

% loop function
L=minreal(zpk(Gc*Gp*Ga*Gs*Gf));

nichols(L)

% step response
T=minreal(zpk(L/(1+L)));
figure(3)
step(T*Kd, 30) % estendo la simulazione per 30sec



