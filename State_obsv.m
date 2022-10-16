% A = [0 1;-1 2];% corrisponde a matrice instabile
A=[-0.8 -1;1 0]; % ha due autovalori complessi coniugati 
                 % con variabili di stato oscillatorie
B = [0 1]';
C = [0 1];
D = 0;
S=ss(A,B,C,D);
H=tf(Sol);
eigA=eig(A)

Mo=obsv(A,C);
rankMo=rank(Mo); % osservabile con rango 2

Lt = place(A',C',[-1 -2]); % se aumento gli autovalori
                            % si converge molto più velocemente
L = Lt'; % coincide con i valori delle slide eig(A-L*C)