%***********************BACK PROPAGATION****************************
clear all;clc
%PESOS ORIGINALES
W1=rand(2,2);
W2=rand(2,1);
%FACTOR DE APRENDIZAJE
n=0.5;
%MATRIZ DE APRENDIZAJE
A=[0 0 0; 0 1 1; 1 0 1; 1 1 0];
%ITERACIONES Y CONTADOR AUXILIAR
c=1;
itera=200000000;
for i=1:itera
    if c==5
        c=1;
    else
        c=c;
    end
% CAPA DE ENTRADA
E1=A(c,1);E2=A(c,2);D=A(c,3);
 % CAPA OCULTA
O1E=E1*W1(1,1)+E2*W1(2,1);
O1=1/(1+exp(-1*O1E));
O2E=E1*W1(1,2)+E2*W1(2,2);
O2=1/(1+exp(-1*O2E));
% CAPA DE SALIDA
S1E=O1*W2(1,1)+O2*W2(2,1);
S1=1/(1+exp(-1*S1E));
ERROR=D-S1;
%BACK PROPAGATION
%CAPA DE SALIDA
DELTAS=S1*(1-S1)*ERROR;
W2(1,1)=W2(1,1)+n*O1*DELTAS; W2(2,1)=W2(2,1)+n*O2*DELTAS;
% CAPA OCULTA
%NEURONA O1
DELTAO1=O1*(1-O1)*DELTAS*W2(1,1);
W1(1,1)=W1(1,1)+n*E1*DELTAO1;
W1(2,1)=W1(2,1)+n*E2*DELTAO1;
%NEURONA O2
DELTAO2=O2*(1-O2)*DELTAS*W2(2,1);
W1(1,2)=W1(1,2)+n*E1*DELTAO2;
W1(2,2)=W1(2,2)+n*E2*DELTAO2;
c=c+1;
end