syms x1 x2;
x=[x1,x2];
f=5*x1^2 + x2^2 + 4*x1*x2 - 14*x1 - 6*x2 + 20;
grad = gradient(f,x);
hes = hessian(f,x);
threshhold = 10^(-6);