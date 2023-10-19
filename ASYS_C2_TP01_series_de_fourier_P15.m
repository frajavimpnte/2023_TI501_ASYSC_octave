% ITESS-TICS Ago-Dic 2022
% ASYSC
% TP01 Problema 14
% Autor: FJMP
% Fecha: 18/oct/2023
% coeficientes

##a0 = 0
##a1 = -1.7132e-08
##a2 = 2.6911e-08
##a3 = 5.7106e-09
##a4 = -2.6911e-08
##a5 = -3.4264e-09
##a6 = 2.6911e-08
##b1 = 1.2732
##b2 = 7.2419e-16
##b3 = -0.1415
##b4 = -1.4484e-15
##b5 = 0.050930
##b6 = 2.1726e-15



pkg load symbolic;
syms x n;

T = 2*pi;
f = 1/T;
%% coeficientes de Fourier
a0 = (2/T) * (
    int(   x, x, -pi/2, pi/2) +
    int(pi-x, x,  pi/2,  3*pi/2) )

an = (2/T) * (
    int(     x * cos (2*pi*n*f*x), x, -pi/2,  pi/2) +
    int((pi-x) * cos (2*pi*n*f*x), x,  pi/2,  3*pi/2)
    )

bn = (2/T) * (
    int(     x * sin (2*pi*n*f*x), x, -pi/2,  pi/2) +
    int((pi-x) * sin (2*pi*n*f*x), x,  pi/2,  3*pi/2)
    )


a0 = double(a0)
N = 10;
for i=1:N
  ai = double( subs(an, n, i) )
endfor

for i=1:N
  bi = double( subs(bn, n, i) )
endfor
