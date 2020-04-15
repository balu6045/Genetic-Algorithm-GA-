clc   %clears the command window
clear all   % clears the previous work space
close all    % closes the privous graphical objects(figures)

%%  Unconstrained function
fun=@(x)(((x(1)-10)^2)+5*((x(2)-12)^2)+(x(3)^4)+5*((x(4)-12)^2)+10*(x(5)^6)+7*(x(6)^2)+(x(7)^4)-4*x(6)*x(7)-10*x(6)-8*x(7));
nvars=7; % number of variables to be optimized
LB=[-10 -10 -10 -10 -10 -10 -10];
UB=[10 10 10 10 10 10 10];
npop=2000;
max_iter=50;
[Xmin,Fmin]=ga_code(fun,nvars,npop,LB,UB,max_iter);
