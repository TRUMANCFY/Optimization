% hw4P4b Cai Fengyu
% I just attach the picture of n < 4, as n >= 4, it is too slow for my
% laptop to run
clear
list1 = zeros(1,8);
for T = 3 : 1 : 10
n = 3;
e1 = [1 0 0]'; e3 = [0 0 1]';
func = @(t) (norm(getmatrix(n, t, T) * e1 - e3))^2;
grad = @(t) double(getgradient(n, t, T, e1, e3));
k = 0;
x = [1 1]';
d = -grad(x);
threshold = 10^(-4);
sigma = 2;
epsilon = 0.5;
alpha = 1;

while (norm(d) >= threshold)
    k = k + 1;
    % x_e = [x_e x];
    f_k = func(x);
    grad_k = grad(x);
    while func(x + alpha .* d) > f_k + epsilon * alpha .* grad_k' * d
        alpha = alpha / sigma;
    end;
%     f_next = @(alpha) func(x + alpha.* d);
%     eqn = diff(f_next, alpha) == 0;
%     a = solve(eqn, alpha)
    x = x + alpha * d;
    d = -grad(x);
    % results(k,:) = [k double(x(1)) double(x(2)) d(1) d(2) norm(d) a subs(f,xsym',x')];
    % results = [results; result];
end
disp(x);
disp(double(func(x)));
list1(T-2) = func(x);
end
plot(3:10,list1);
title('J varies according to T with n=3')