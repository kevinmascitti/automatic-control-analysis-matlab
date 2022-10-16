A=[0 0 1; 2 -1 2; 0 1 1];
C=[0 0 1];
Mo=obsv(A,C);
rMo=rank(Mo) % completamente osservabile
Lt=place(A',C',[0.2 0.4 0.5]);
L=Lt'
eig(A-L*C)