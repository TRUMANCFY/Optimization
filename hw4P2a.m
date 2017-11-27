% hw4P2a Cai Fengyu
%% initialize
clear
results = zeros(1,8);
%f = sym('5*x_1^2 + x_2^2 + 4*x_1*x_2 - 14*x_1 - 6*x_2 + 20');
syms x_1 x_2;
f=5*x_1^2 + x_2^2 + 4*x_1*x_2 - 14*x_1 - 6*x_2 + 20;
grad = gradient(f);
syms x_1 x_2;
threshold = 10^(-6);
k = 1;
x = [0 10]';
d = [-26 -14]';
alpha=( d(1)^2 + d(2)^2 ) / (2 * ( 5 * d(1)^2 + d(2)^2 + 4*d(1)*d(2) ) );
results(k,:) = [k, x(1), x(2), d(1), d(2), norm(d), alpha, subs(f,[x_1 x_2], x') ];
x = x + alpha*d;
%x_pre = x;
x_e = [];
%% main function
while norm(d)>=threshold
    x_e=[x_e x];
    k = k + 1;
    d = -1*subs(grad, [x_1,x_2], x');
    alpha = (d(1)^2+d(2)^2)/(2*(5*d(1)^2 + d(2)^2 + 4*d(1)*d(2) ) );
    x = x + alpha .* (d);
    f_k = subs(f, [x_1 x_2], x');
    results(k,:) = [k, x(1), x(2), d(1), d(2), norm(d), alpha, subs(f,[x_1 x_2], x') ];
end
pnts=zeros(2,size(x_e,2));
for i=1:size(x_e,2)
    pnts(1,i)=x_e(1,i);
    pnts(2,i)=x_e(2,i);
end
% f1=5*x_1^2 + x_2^2 + 4*x_1*x_2 - 14*x_1 - 6*x_2 + 20;
k = results(:,1);
x1 = results(:,2);
x2 = results(:,3);
d1 = results(:,4);
d2 = results(:,5);
normd = results(:,6);
a = results(:,7);
funcval = results(:,8);
disp(table(k,x1,x2,d1,d2,normd,a,funcval));
figure(1);
lt=linspace(10,60,30);
fcontour(f,'LevelList',lt);

hold on
plot(pnts(1,:),pnts(2,:),'-x');
hold off;
figure(2);
ezmeshc(f, [-10,10], [-10,10]);