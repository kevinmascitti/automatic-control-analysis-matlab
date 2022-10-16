close all
clear all

s=tf('s');
Gp=10/(s*(s+125));
Gs=5;
Ga=3;
Tp=1.024;
Sp=1.33;
Kd=1;
Kc=1;
Gf=1/(Kd*Gs);
Lin=minreal(zpk((1/s)*Gp*Ga*Gs*Gf));
figure(1)
myngridst(Tp,Sp);
nichols(Lin)

wcdes=50;

% rete zero
wnorm_zero=100;
z=wcdes/wnorm_zero;
Rz=1+s/z;

Gc=Kc/s*Rz;
L=Gc*Gp*Gs*Ga*Gf;
hold on
nichols(L)

T=minreal(zpk(L/(1+L)));
figure(3)
step(T/(Gs*Gf),0.3);
bodemag(T)
[mag,ph]=bode(T,2500);
magdB=20*log10(mag)

