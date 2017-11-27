clear
syms x_1 x_2 alpha;
theta=10;
f =@(x) -9 * x(1) - 10 * x(2) + theta * (-log(100-x(1)-x(2)) - log(x(1)) - log(x(2)) - log(50 - x(1) + x(2)));
grad = @(x) [theta/(x(2)-x(1)+50)-theta/(x(1)+x(2)-100)-theta/x(1)-9;
            -theta/(x(2)-x(1)+50)-theta/(x(1)+x(2)-100)-theta/x(2)-10];
thresh1 = 10^(-5);
thresh2 = 10^(-6);
X = [10 20]';
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