%% Esempio 1 
%% es 8
clear all
clc
close all

s=tf('s');
U=2/s;
G=3*(s-1)*(s+4)/((s+1)*(s+2)^2);
Y=G*U;
Y=minreal(zpk(Y));
[numY,denY]=tfdata(Y,'v');
[r1,p1]=residue(numY,denY)
%% es 10
s=tf('s');
G=(s-2)*(s+5)/((s+1)*(s+2));
[modulo,fase]=bode(G,2)
%% es 11
A=[-251 31; -2032 251];
B=[6;49];
M=ctrb(A,B);
rank(M); % ok compl raggiungibile
K=place(A,B,[-3,-5])
%% es 12
A=[30 39 51; -52 -59 -49; 8 7 -7];
C=[3 8 31];
M=obsv(A,C);
rank(M); % non compl osservabile
%% Esempio 2
%% es 4
clear all
clc
close all

A=[4 2 6; 2 1 3; 9 2 8];
B=[4;2;0];
M=ctrb(A,B);
rank(M); % non compl raggiungibile
%% es 7
A=[ 0 1 0 0; -3 -4 0 0; 0 0 0.1 0; 0 0 0 -0.5 ];
eig(A)
%% es 13
A=[0 0 0.008; 1 0 -0.12; 0 1 0.6];
C=[0 0 1];
M=obsv(A,C);
rank(M); % compl osservabile
L=place(A',C',[0.05 0.1 0.2])'

%% Esempio 3
%% es 1
clear all
clc
close all

s=tf('s');
Y=6*(s+1)*(s-4)/(s*(s-1)*(s+2)^2);
Y=minreal(zpk(Y));
[num, den]=tfdata(Y,'v');
[r, p] = residue(num,den)
%% es 2
s=tf('s');
G=(s-1)*(s+5)/((s+1)*(s+2));
[modulo,fase]=bode(G,1);
%% es 5
A=[-299 37; -2416 299];
B=[7;57];
M=ctrb(A,B);
rank(M); % ok
K=place(A,B,[-1 -7])
%% es 6
A=[44 -46 -6; 49 -59 3; 51 -39 -21];
C=[31 -8 -28];
M=obsv(A,C);
rank(M); % non compl osservabile

%% Esempio 4
%% es 5
clear all
clc
close all

A=[0 -6 7; 0 -5 0; 0 0 -3];
B=[-3;1;1];
C=[0 -4 5];
D=[3];
s=tf('s');
H=C*(s*eye(3)-A)^(-1)*B+D;
minreal(zpk(H))
%% es 6
A=[0 0 1; 2 -2 -1; 0 -1 -1];
B=[0;1;0];
M=ctrb(A,B);
rank(M); % ok
K=place(A,B,[-1,-2,-3])
%% es 7
A=[-7 -8; 4 5];
B=[8;9];
C=[-1 1];
D=[5];
x0=[1;3];
s=tf('s');
Y=C*(s*eye(2)-A)^(-1)*x0;
Y=minreal(zpk(Y),1e-3);
[num,den]=tfdata(Y,'v');
[r,p]=residue(num,den)
%% es 8 
A=[0 0 1; 2 -3 2; 0 -1 -1];
C=[-4 0 -2];
M=obsv(A,C);
rank(M); % non compl osservabile

%% Esempio 5
%% es
clear all
clc
close all





