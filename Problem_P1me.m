clear all
clc
close all

s=tf('s');
Gp=25/(s^3+3.3*s^2+2*s);
Gf=1;
Gs=1;
Kc=6;
Ga=0.095;
nu=0;

Lin=Kc/(s^nu)*Gp*Ga*Gf*Gs;

[nLin,dLin]=tfdata(Lin,'v');
figure(1)
nyquist1(nLin,dLin);

over=0.1;
a=abs(log(over))/(sqrt(pi^2+(log(over))^2));
Tp=1/(2*a*sqrt(1-a^2));
Sp=2*a*sqrt(2+4*a^2+2*sqrt(1+8*a^2))/(sqrt(1+8*a^2)+4*a^2-1);
tr=3;
ts=12;
wctr=(pi-acos(a))/(sqrt(1-a^2)*tr)*sqrt(sqrt(1+4*a^4)-2*a^2);
wcts=(-log(0.05))/(a*ts)*sqrt(sqrt(1+4*a^4)-2*a^2);

wcdes=0.7;

% rete lead
wdnorm=0.7;
zd=wcdes/wdnorm
md=16;
Rd=(1+s/zd)/(1+s/(md*zd));

%rete lag
winorm=1000;
zi=wcdes/winorm;
mi=10^(18.7/20);
Ri=(1+s/(mi*zi))/(1+s/zi);

L=(Kc/s^nu)*Ga*Gf*Gs*Gp*Rd*Ri;

figure(2)
myngridst(Tp,Sp);
nichols(Lin)
nichols(L)

figure(3)
T=minreal(zpk(L/(1+L)));
S=minreal(zpk(1/(1+L)));
step(T/(Gf*Gs),30)
[m1,f1]=bode(S,0.02);
20*log10(m1)
[m2,f2]=bode(T,40);
20*log10(m2)