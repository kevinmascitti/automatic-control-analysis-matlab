% insert data of control design problem
clear all
close all
s=tf('s');
Gp=25/(s^3+3.3*s^2+2*s);
Ga=0.095;
Gs=1;

% performance requirments translation
Kd=1; % requirment 1
Gf= 1/(Kd*Gs);

% controller parameters constraints (requirements 2 and 3)
nu=0;
Kc=6; % |Kc|>=5.61

% Constraints derived from sinusoidal disturbances and transient
% requirements
Tp_max=1.05;
Sp_max=1.36;
wc_min=0.66;
wc_max=1.4;

% let me compute the initial loop function Lin
Lin=Kc/(s^nu)*Gp*Ga*Gf*Gs;

% plot Lin in the Nichols chart together with the forbidden region
% corresponding to the constraints on Tp and Sp
figure(1)
myngridst(Tp_max, Sp_max);
nichols(Lin);

% Selection of wcdes
wcdes=0.8;

% design of the lead/lag networks

% lead network
wnorm_Rd=1.2; % in order to gain 45 degrees
zd=wcdes/wnorm_Rd;
md=11;
Rd=(1+s/zd)/(1+s/(md*zd));

% lag network
wnorm_Ri=1000;
p_i=wcdes/wnorm_Ri;
mi=10^(20/20);
Ri=(1+s/(mi*p_i))/(1+s/p_i);

L=Kc/(s^nu)*Gp*Ga*Gf*Gs*Rd*Ri;

% final controller
Gc=(Kc/s^nu)*Rd*Ri;

figure(3)
T=L/(1+L);
step(T/(Gf*Gs))
