%% initialize
results = zeros(1,8);
x1 = [40 -100]';
Q = [20 5;
     5  2];
c = [14 6]';
syms x_1 x_2;
x = [x_1 x_2]';
f = 1/2*x.'*Q*x - c.'*x + 10;
threshold = 10^(-6);
k = 1;
grad = gradient(1/2*x'*Q*x - c'*x + 10);
d = -1 * subs(grad, x', x1');
syms alpha 
alpha = solve(subs(grad, x, x - alpha .* grad).' * (-1) * grad == 0, 'alpha');
[k, subs(x', x', x1'), d(1), d(2), subs(norm(d),x',x1'), subs(alpha,x',x1'), subs(f, x', x1') ]
results(k,:) = [k, subs(x', x', x1'), d(1), d(2), subs(norm(d),x',x1'), subs(alpha,x',x1'), subs(f, x', x1') ]
x_k = x1 + subs(alpha, x', x1') .* d;
while 1>0
    k = k + 1;
    d = -1 * subs(grad, x', x_k');
    alpha_k = subs(alpha, x', x_k');
    x_k = x_k + alpha_k * d;
    f_k = subs(f, x', x_k');
    results(k,:) = [k, subs(x',x',x_k'), d(1), d(2), norm(d), alpha_k, subs(f, x', x_k') ]
        if norm(d) < threshold
        break;
    end
end


