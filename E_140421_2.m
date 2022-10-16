A=[3 2; 0 -5];
B=[1 0]';
C=[1 1];
D=0;
eig(A);
Mr=ctrb(A,B);
rMr=rank(Mr); % rango 1 quindi non completamente raggiungibile
% se è completamente raggiungibile posso scegliere arbitrariamente
% gli autovalori e di conseguenza trovo i guadagni K tale che
% dai calcoli escano quegli autovalori alla fine
% se non ho completa raggiungibilità, NON posso scegliere
% arbitrariamente gli autovalori ma devo basarmi sui valori di K
% non per tutte le scelte degli autovalori posso trovare K
% ma posso provarci per alcuni particolari valori
% se K è vincolato. posso trovare K in modo che posso ottenere
% asintoticamente stabilità facendo calcoli a mano.
% risolvo lambda*I-(A-BK)e trovo il polinomio caratteristico
% lambda^2+(alfa+2)*lambda+5*alfa-15 e voglio imporre asintotica
% stabilità quindi impongo che entrambe le radici del polinomio
% siano negative e per la regola di cartesio voglio due permanenze
% per avere due soluzioni negative imponendo alfa+2>0 e 5*alfa-15>0
% ottenendo alfa>3