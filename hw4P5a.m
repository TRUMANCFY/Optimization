% hw4P5a Cai Fengyu
%% initialize
results = zeros(1,5);
f = sym('abs(exp(-1*x^2) - x)');
syms x;
grad = gradient(f);
k = 1;
x_k = -10.0;
f_k = subs(f, x, x_k);
f_pre = 0;
grad_k = subs(grad, x, x_k);
d_k = -1 * (grad_k)^(-1) * f_k;
threshold = 10^(-5);
r = f_k / grad_k;
results(k,:) = [k, double(x_k), double(f_k), double(grad_k), double(r)];

%% main function
while 1 > 0
    k = k + 1;
    x_k = x_k + d_k;
    f_k = subs(f, x, x_k);
    grad_k = subs(grad, x, x_k);
    r = f_k / grad_k;
    results(k,:) = [k, double(x_k), double(f_k), double(grad_k), double(r)];
    if(abs(f_pre - f_k)) < threshold
        break;
    end;
    f_pre = f_k;
    d_k = -1 * (grad_k)^(-1) * f_k;
end;
kval = results(:,1);
xval = results(:,2);
fval = results(:,3);
gradval = results(:,4);
ratio = results(:,5);
disp(table(kval, xval, fval, gradval, ratio));