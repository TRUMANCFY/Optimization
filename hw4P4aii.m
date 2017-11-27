%% initialize
n = 3; 
T0 = 3;
e1 = [1 0 0]'; e3 = [0 0 1]';
f = @(t) (norm(create(n, t, T0) * e1 - e3))^2;
grad = @(t) double(func_grad(n, t, T0, e1, e3));
sigma = 2;
epsilon = 0.5;
alpha = 1;
threshold = 10^(-6);
t = [1, 1];
k = 1;
t_k = t;
d_k = -grad(t_k);

%% main function
while norm(d_k) > threshold
    f_k = f(t_k)
    grad_k = grad(t_k)
    while f(t_k + alpha .* d_k') > f_k + epsilon * alpha .* grad_k .* d_k
        alpha = alpha / sigma;
    end;
    t_k = t_k + alpha .* d_k'
    d_k = -grad(t_k)
    k = k + 1
    %alpha = range(x_k, d_k);
    
end;

