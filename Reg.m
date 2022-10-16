A=[0 1; 900 0];
B=[0 -9]';
C=[600 0];
D=0;
S=ss(A,B,C,D);
H_S=minreal(zpk(S)); % poli coincidenti con autovalori di A

figure(1);
step(H_S);
% Progetto la legge di controllo in retroazione statica dallo stato
Mr=ctrb(A,B);
rankMr=rank(Mr); % controllabile

% smorzamento a 0: poli immaginari puri
% smorzamento a 1: poli reali con cui non ho oscillazioni dopo
pc=[1 2*0.2*45 45^2];
aut_des_contr=roots(pc)
% damp(aut_des_contr)

K=place(A,B,aut_des_contr);
aut_contr=eig(A-B*K); % verfica

% progetto l'osservatore (Osservatore di Luemberger)
Mo=obsv(A,C);
rankMo=rank(Mo); % completamente osservabile

po=[1 200 10000];
aut_des_oss=roots(po);

Lt=acker(A',C',aut_des_oss);
L=Lt';
aut_oss=eig(A-L*C);
% place è più accurato ma non permette di usare autovalori
% con molteplicità maggiore di 1 perciò uso acker

% Progetto della costante moltiplicativa del riferimento
alpha=1;

% anche in assenza di risonanza, posso avere comunque
% un comportamento strano con transitorio iniziale con picchi
% iniziali e si può risolvere solo regolando anche gli zeri
% oltre ai poli della funzione di trasferimento