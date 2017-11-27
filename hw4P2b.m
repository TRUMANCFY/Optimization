% hw4P2b Cai Fengyu
options = optimoptions(@fminunc,'Display','iter','Algorithm','quasi-newton');
f = @(x)5*x(1)^2 + x(2)^2 + 4*x(1)*x(2) - 14*x(1) - 6*x(2) + 20;
x0 = [0, 10];
[x,fval,exitflag,output] = fminunc(f,x0,options);