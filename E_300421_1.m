clear all
clc
close all

T=1;
z=tf('z',T)

A=[1 0 0; 0 1 0; 1 0 -1];
% A=[1 1 0; 0 1 0; 0 0 -1];
n=size(A,1);
eig(A)
tol=1e-3;
zpk(minreal(inv(z*eye(n)-A),tol))