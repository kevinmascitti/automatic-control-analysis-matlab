A=[-299 37;-2416 299];
B=[7 57]';
Mr=ctrb(A,B);
rMr=rank(Mr) % rango uguale alla dimensione dello spazio di
    % stato quindi è completamente raggiungibile
K=place(A,B,[-1 -7])