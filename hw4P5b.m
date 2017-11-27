% hw3P5b Cai Fengyu
options = optimoptions(@fminunc,'Display','iter','Algorithm','quasi-newton');
f = @(x)abs(exp(-1*x^2) - x)
x0 = -10;
[x,fval,exitflag,output] = fminunc(f,x0,options)