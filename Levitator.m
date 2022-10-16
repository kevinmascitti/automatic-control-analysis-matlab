% Controller design for Levitator
clear all
close all
clc
s=tf('s');
Gp=-38.3517/((s-30.34)*(s+30.34));
[nGp,dGp]=tfdata(Gp,'v');
Gs=555.89;
Ga=0.4;
Gr=1;
Gd=1;
Gf=1;
Kd=1/(Gs*Gf);
nu=1;
Kc=-1*10^(6/20)*10^(4.74/20);%*10^(22/20); % magnitude of Kc is free

% Overshoot requirements translation
overshoot_up=0.25;
damp=abs(log(overshoot_up))/sqrt(pi^2+(log(overshoot_up))^2);
Tp=1/(2*damp*sqrt(1-damp^2));
Sp=2*damp*sqrt(2+4*damp^2+2*sqrt(1+8*damp^2))/(sqrt(1+8*damp^2)+4*damp^2-1);

% Rise time requirements translation
tr_up=0.015;
wc_lw=(1/sqrt(1-damp^2)*(pi-acos(damp))*sqrt(sqrt(1+4*damp^4)-2*damp^2))/tr_up;

Lnyq=Kc/s^nu*Gp*Ga*Gs*Gf;
[nLnyq,dLnyq]=tfdata(Lnyq,'v');

figure(1)
nyquist1(nLnyq,dLnyq);

figure(2)
myngridst(Tp,Sp);
omega=logspace(-2,4,500);
nichols(Lnyq,omega);

% Design solution 1 (Zero network + lead)
wcdes=200;
% Zero network
wnorm=100;
z=wcdes/wnorm;
Rz=(1+s/z);
% Lead networks
wnorm1=6;
zd1=wcdes/wnorm1;
md1=14; %30
Rd1=(1+s/zd1)/(1+s/(md1*zd1));

% Controller
Gc=Kc/s^nu*Rz*Rd1;
[nGc,dGc]=tfdata(Gc,'v');
L=Gc*Gp*Ga*Gs*Gf;

%figure(3)

