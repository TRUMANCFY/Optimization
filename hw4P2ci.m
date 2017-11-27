% hw4P2c(i) Cai Fengyu
clear
%% initialization
results = zeros(1,8);
Q = [20 5;5 2];
x = [40 -100]'; 
c = [14 6]';
syms x_1 x_2 alpha;
xsym = [x_1 x_2]';
f = 1/2*xsym'*Q*xsym - c'*xsym + 10;
grad = gradient(f,xsym');
threshold = 10^(-6);
k = 0;
d = -subs(grad,xsym',x');
x_e = [];
f_k=[];
a = 0;
%% Iteration
while (norm(d) >= threshold)
    k = k + 1;
    x_e = [x_e x];
    d = -subs(grad, xsym', x');
    f_next = @(alpha) subs(f, xsym', (x + alpha * d)');
    eqn = diff(f_next, alpha) == 0;
    a = solve(eqn, alpha);
    x = x + a * d;
    f_k = [f_k subs(f, xsym', x')];
    results(k,:) = [k double(x(1)) double(x(2)) d(1) d(2) norm(d) a subs(f,xsym',x')];
    % results = [results; result];
end
%% Picture
pnts=zeros(2,size(x_e,2));
for i=1:size(x_e,2)
    pnts(1,i)=x_e(1,i);
    pnts(2,i)=x_e(2,i);
end

k = results(1:10,1);
x1 = results(1:10,2);
x2 = results(1:10,3);
d1 = results(1:10,4);
d2 = results(1:10,5);
normd = results(1:10,6);
a = results(1:10,7);
funcval = results(1:10,8);
disp(table(k,x1,x2,d1,d2,normd,a,funcval));

k = results(end-9:end,1);
x1 = results(end-9:end,2);
x2 = results(end-9:end,3);
d1 = results(end-9:end,4);
d2 = results(end-9:end,5);
normd = results(end-9:end,6);
a = results(end-9:end,7);
funcval = results(end-9:end,8);
disp(table(k,x1,x2,d1,d2,normd,a,funcval));
figure(1);
% lt=linspace(10,60,30);
% fcontour(f,'LevelList',lt);
fcontour(f);

hold on
plot(pnts(1,:),pnts(2,:),'-x');
hold off;
figure(2);
ezmeshc(f, [-10,10], [-10,10]);