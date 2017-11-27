% hw3P3a Cai Fengyu
% hw3P3b At first the convergence rate can maintain at a const which is
% less than 1. However, as the accuray of Matlab itself, in the final part,
% it will vibrate on 1, but not converge.
clear all
clc
points = [8, 90; 1 40; 15, 68.95; 10, 20]';
for theta = [10,100]
    for i = 1:4
syms x_1 x_2 alpha;
f =@(x) -9 * x(1) - 10 * x(2) + theta * (-log(100-x(1)-x(2)) - log(x(1)) - log(x(2)) - log(50 - x(1) + x(2)));
grad = @(x) [theta/(x(2)-x(1)+50)-theta/(x(1)+x(2)-100)-theta/x(1)-9;
            -theta/(x(2)-x(1)+50)-theta/(x(1)+x(2)-100)-theta/x(2)-10];
thresh1 = 10^(-5);
thresh2 = 10^(-6);
X = points(:,i);
d = -grad(X);
a = 0;
k = 0;
while (norm(d)>=thresh1)
    k = k + 1;
    d = -grad(X);
%     f_next = @(alpha) subs(f, [x_1 x_2], (x + alpha * d).');
%     eqn = diff(f_next, alpha) == 0;
%     a = solve(eqn, alpha);
    a = bisection(X, d, thresh2,grad);
    X = X + a * d;
end
disp('input theta: '); disp(theta);
disp('the input point: '); disp(points(:,i));
disp('the number of iteration: '); disp(k);
disp('the minimizer: '); disp(X);
disp('the minimum value: '); disp(f(X));
    end
end