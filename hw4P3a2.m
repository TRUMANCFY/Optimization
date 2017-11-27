%% initialize
clear all;
syms x_1 x_2;
theta = 100;
f = -9*x_1 - 10*x_2 + theta*(-log(100 - x_1 - x_2)- log(x_1) - log(x_2) - log(50-x_1+x_2));
grad = @(x)[theta/(x(2) - x(1) + 50) - theta/(x(1) + x(2) - 100) - theta/x(1) - 9
    - theta/(x(2) - x(1) + 50) - theta/(x(1) + x(2) - 100) - theta/x(2) - 10];
x = [1 40]';
threshold1 = 10^(-5);
threshold2 = 10^(-6);
d = -grad(x);
a = 0;
k = 0;

%% main function
while 1 > 0
    k = k + 1
    d = -grad(x)
    a = bi_search(x, d, threshold2, theta)
    x = x + a .* d
    f_k = double(subs(f, [x_1, x_2], x.'))
    %x = vpa(x, 3);
    if norm(d) < threshold1
        break;
    end
end

