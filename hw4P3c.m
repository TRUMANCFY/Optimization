%% Some explation about the Armijo algorithm
% We can check the the running time of two algorithm
% for point 1: in 3a: 583 iterations and 0.473 s
%              in 3c: 33 iterations and 0.385 s
% for point 2: in 3a: 671 iterations and 0.477 s
%              in 3c: 208 iterations and 0.455 s
% for point 3: in 3a: 809 iterations and 0.502 s
%              in 3c: 316 iterations and 0.462 s
% for point 4: in 3a: 686 iterations and 0.536 s
%              in 3c: 144 iterations and 0.386 s
% Therefore, we can see that the usage of Armijo algorithm can decrease the
% number of iterations and decrease the running time (namely, increase the speed for converge)
%% initialize
clear
clc
syms alpha
sigma = 2;
epsilon = 0.5;
theta = 10;
f =@(x) -9 * x(1) - 10 * x(2) + theta * (-log(100-x(1)-x(2)) - log(x(1)) - log(x(2)) - log(50 - x(1) + x(2)));
grad = @(x) [theta/(x(2)-x(1)+50)-theta/(x(1)+x(2)-100)-theta/x(1)-9;
            -theta/(x(2)-x(1)+50)-theta/(x(1)+x(2)-100)-theta/x(2)-10];
thresh = 10^(-2);
X = [10 20]';
d = -grad(X);
a1 = getrange(X,d);
alpha = a1;
k = 0;
%% main function
while norm(d) > thresh
   
    f_k = f(X);
    grad_k = grad(X);
    while f(X+alpha*d) > f_k + epsilon * alpha * grad_k' * d 
        alpha = alpha / sigma;
    end;
    X = X + alpha * d;
    d = -grad(X);
    k = k + 1;
    a1 = getrange(X,d);
    if a1<0
        disp('error');
        break;
    end
    alpha = a1;
end;
