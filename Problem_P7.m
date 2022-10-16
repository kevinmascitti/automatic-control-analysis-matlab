clear all
clc
close all

Gs=0.5;
Ga=0.112;
s=tf('s');
Gp=100/(s^3+5.5*s^2+4.5*s);
Kd=8;
Gf=0.25;
Kc=0.1*10^(7.6/20);
nu=1;
Lin=(Kc/s^nu)*Gs*Ga*Gf*Gp;

over=0.13;
a=abs(log(over))/(sqrt(pi^2+(log(over))^2));
Tp=1/(2*a*sqrt(1-a^2));
Sp=(2*a*sqrt(2+4*a^2+2*sqrt(1+8*a^2)))/(sqrt(1+8*a^2)+4*a^2-1);
tr=1.8;
wcrisetime=(pi-acos(a))/(sqrt(1-a^2)*tr)*sqrt(sqrt(1+4*a^4)-2*a^2);
ts=6;
wcsettlingtime=(-log(0.05))/(a*ts)*sqrt(sqrt(1+4*a^4)-2*a^2);

[nLin,dLin]=tfdata(Lin,'v');
figure(1)
nyquist1(nLin,dLin);
figure(2)
myngridst(Tp,Sp)
nichols(Lin)

wcdes=1.4;

%rete zero
wnorm=20;
z=wcdes/wnorm;
Rz=(1+s/z);

%rete lead
wnormd=2.2;
md=8;
zd=wcdes/wnormd;
Rd=(1+s/zd)/(1+s/(md*zd));

L=(Kc/s^nu)*Gs*Ga*Gf*Gp*Rz*Rd;
nichols(L)

figure(3)
T=L/(1+L);
step(T/(Gf*Gs),40);
S=1/(1+L);

[m1,f1]=bode(T,60);
20*log10(m1)
[m2,f2]=bode(S,0.03);
20*log10(m2)

