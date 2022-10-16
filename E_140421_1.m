A=[0 -1; 3 -2];
B=[1 1]';
C=[1 1];
D=0;
Mr=ctrb(A,B); % completamente raggiungibile
rMr=rank(Mr);
K=place(A,B,[20 -10])
eig(A-B*K) % verifica