% hw4P1d Cai Fengyu
% fun = @(x)-12*x(2) + 4*x(1)^2 + 4*x(2)^2 + 4*x(1)*x(2)
fun = @(x) 2*x(1)^2 + 3*x(1)*x(2) + 4*x(2)^2 +2*x(3)^2 - 2*x(2)*x(3) + 5*x(1) + 3*x(2) - 4*x(3);
x0 = [0 0 0]
[x,fval] = fminunc(fun,x0);
disp('The minimizer is'); disp(x);
disp('The minimum value is'); disp(fval);
