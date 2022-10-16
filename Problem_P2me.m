clear all
clc
close all

s=tf('s');
Gf=1;
Gs=1;
Ga=-0.09;
Gp=40/(s^2+3*s+4.5);
Kc=-3.8;
nu=1;

Lin=(Kc/s^nu)*Gf*Gs*Ga*Gp;

over=0.08;
a=abs(log(over))/sqrt(pi^2+(log(over))^2);
Tp=1/(2*a*sqrt(1-a^2));
Sp=2*a*sqrt(2+4*a^2+2*sqrt(1+8*a^2))/(sqrt(1+8*a^2)+4*a^2-1);
tr=2.5;
ts=10;
wctr=(pi-acos(a))/(tr*sqrt(1-a^2))*sqrt(sqrt(1+4*a^4)-2*a^2);
wcts=(-log(0.05))/(a*ts)*sqrt(sqrt(1+4*a^4)-2*a^2);

figure(1)
[n,d]=tfdata(Lin,'v');
nyquist1(n,d)

wcdes=1;

% rete zero
wnorm=0.36;
z=wcdes/wnorm
Rz=(1+s/z);

% rete lag
winorm=500;
zi=wcdes/winorm;
mi=10^(9.8/20)
Ri=(1+s/(mi*zi))/(1+s/zi);

L=(Kc/s^nu)*Gf*Gs*Ga*Gp*Rz*Ri;

figure(2)
myngridst(Tp,Sp)
nichols(Lin)
nichols(L)

figure(3)
T=L/(1+L);
S=1/(1+L);
step(T/(Gf*Gs),30)
[m,f]=bode(T,50);
20*log10(m)