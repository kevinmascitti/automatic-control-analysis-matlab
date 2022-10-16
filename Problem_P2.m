clear all
close all
s=tf('s');
Ga=-0.09;
Gs=1;
Gf=1;
Gp=40/(s^2+3*s+4.5);
Kd=1;
Kc=-3.8;
nu=1;
Lin=(Kc/s^nu)*Ga*Gs*Gp*Gf;

figure(1)
[numLin,denLin]=tfdata(Lin,'v');
nyquist1(numLin,denLin)

Tp_max=1.05;
Sp_max=1.36;

figure(2)
myngridst(1.05,1.36)
nichols(Lin)

% controller design
wc_des=3;

% zero network zd=z e md->inf 
% mi da modulo 3 dB dei 7dB e fase 44° dei 90°
wnorm_z=1;
z=wc_des/wnorm_z;
Rz=(1+s/z);

% lead network
wnorm_lead1=1.2;
md1=16;
zd1=wc_des/wnorm_lead1;
Rd1=(1+s/zd1)/(1+s/(md1*zd1));

% lag network
wnorm_lag1=100; %final 500
pi1=wc_des/wnorm_lag1;
mi1=10^(3/20); %final value 22dB
Ri1=(1+s/(mi1*pi1))/(1+s/pi1);

% controller
Gc=Kc/s^nu*Rz*Rd1*1/(1+s/50);%*Ri1
hold on
L=Gc*Gp*Ga*Gs*Gf;
nichols(L)

% step response
T=minreal(zpk(L/(1+L)));
figure(3)
step(T/(Gf*Gs),15) %15 è l'orizzonte temporale in cui vedo la risposta

[numGp, denGp]=tfdata(Gp,'v');
[numGc, denGc]=tfdata(Gc,'v');

% il grafico della regione proibita è solo indicativo e
% essere fuori dalla regione proibita NON è necessario né
% sufficiente per rispettare le specifiche. L'obiettivo
% finale è solo soddisfare le specifiche!

[m,f]=bode(T,50);
K=20*log10(m) % se non è soddisfatta devo aggiungere un polo al controllore
% per ridurre ancora il modulo a frequenza quasi come omega dello spigolo
% 50rad/s: devo perdere 2 dB. Per farlo posso mettere un polo direttamente
% alla frequenza dello spigolo perché normalmente il poo attenua di 3dB
% nella sua frequenza.

