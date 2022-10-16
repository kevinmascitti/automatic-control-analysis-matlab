A = [1 3;4 2];
B = [-1 2]';
C = [1 1];
D = 0;
Sol=ss(A,B,C,D);
Hol=tf(Sol);

eig_ol=eig(A); % instabile
Mr=ctrb(A,B);
rankMr=rank(Mr); % 2: completamente raggiungibile
lambda_cl=[-2 -3];
K=place(A,B,lambda_cl);
alpha=[-(C-D*K)*(A-B*K)^-1*B+D]^-1;
 
Scl=ss(A-B*K,B*alpha,C-D*K,D*alpha);
Hcl=tf(Scl);
figure(1)
step(Hcl,2) % risposta al gradino calcolata su orizzonte temporale pari a 2

Mo=obsv(A,C);
rankMo=rank(Mo) % non si può fare osservatore perché rango = 1 (non osservabile)