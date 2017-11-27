%% initialization
x = [8 90]';
syms x_1 x_2 alpha;
theta = 100;
f = -9 * x_1 - 10 * x_2 + theta * (-log(100-x_1-x_2) - log(x_1) - log(x_2) - log(50 - x_1 + x_2));
grad = gradient(f);
thresh1 = 10^(-4);
thresh2 = 10^(-4);
d = -subs(grad, [x_1 x_2], x');
a = 0;
k = 0;

%% run the loop
while (norm(d) >= thresh1)
    k = k + 1
    d = -subs(grad, [x_1 x_2], x');
%     f_next = @(alpha) subs(f, [x_1 x_2], (x + alpha * d).');
%     eqn = diff(f_next, alpha) == 0;
%     a = solve(eqn, alpha);
    a = bisection(x, d, thresh2, theta)
    x = x + a * d;
    x = vpa(x,7)
end