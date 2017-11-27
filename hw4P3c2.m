%% initialize
syms x_1 x_2;
f = -9*x_1 - 10*x_2 + 10*(-log(100 - x_1 - x_2)- log(x_1) - log(x_2) - log(50-x_1+x_2));
sigma = 2;
epsilon = 0.5;
grad = gradient(f);
x = [8 90]';
d = -grad;
k = 1;
threshold = 10^(-6);
x_k = x;
d_k = -subs(grad, [x_1 x_2], x');
a1 = getrange(x,d_k);
alpha = a1;
%% main function
while norm(d_k) > threshold
    d_k = subs(d, [x_1 x_2], x_k');
    f_k = subs(f, [x_1 x_2], x_k');
    grad_k = subs(grad, [x_1 x_2], x_k');
    while subs(f, [x_1 x_2], x_k' + alpha .* d_k') > f_k + epsilon * alpha .* grad_k .* d_k
        alpha = alpha / sigma;
    end;
    x_k = x_k + alpha .* d_k;
    k = k + 1;
    a1 = getrange(x,d_k);
    alpha = a1;
end;
