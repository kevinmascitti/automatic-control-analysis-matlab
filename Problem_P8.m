clear all
clc
close all

s=tf('s');
Gp=-30/(s^3+3*s^2+2*s);
Ga=0.06;
Gs=10;
Gf=0.01;
Kc=-0.05*10^(14.7/20)
nu=1;

Lin=(Kc/s^nu)*Gp*Gf*Gs*Ga;

over=0.14;
a=abs(log(over))/(sqrt(pi^2+(log(over))^2));
Tp=1/(2*a*sqrt(1-a^2));
Sp=(2*a*sqrt(2+4*a^2+2*sqrt(1+8*a^2)))/(sqrt(1+8*a^2)+4*a^2-1);
tr=2.5;
st=13;
wctr=(pi-acos(a))/(sqrt(1-a^2)*tr)*sqrt(sqrt(1+4*a^4)-2*a^2);
wcst=(-log(0.05))/(a*st)*sqrt(sqrt(1+4*a^4)-2*a^2);

wcdes=0.95;

%rete zero
wnorm=40;
z=wcdes/wnorm
Rz=1+s/z;

%rete lead
wdnorm=1;
md=11;
zd=wcdes/wdnorm
Rd=(1+s/zd)/(1+s/(md*zd));

L=(Kc/s^nu)*Gp*Gf*Gs*Ga*Rz*Rd;

figure(1)
[nLin,dLin]=tfdata(Lin,'v');
nyquist1(nLin,dLin);

figure(2)
myngridst(Tp,Sp);
nichols(Lin);
nichols(L);

figure(3)
T=L/(1+L);
S=1/(1+L);
step(T/(Gf*Gs),40)

[m1,f1]=bode(T,40);
20*log10(m1)