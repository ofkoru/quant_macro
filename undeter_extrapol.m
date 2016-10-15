clear all
syms a b c x
% undetermined coefficients method
x1 = 2;
h=1/10^3;
x2 = x1-h;
x3 = x1+h;
g=  x^2;
dg= matlabFunction(diff(g));
t=@(a,b,c) [a+b+c, b*(x2-x1)+c*(x3-x1)-1,  b*(x2-x1)^2+c*(x3-x1)^2];
[sola, solb, solc] = solve(t);
g= matlabFunction(g);
y =(sola*g(x1)+solb*g(x2)+solc*g(x3));
err = abs(eval(dg(2)-y));

% richardson's extrapolation
(-g(x1+2*h)+8*g(x1+h)-8*g(x1-h)+g(x1-2*h))/(12*h)
dg(2)-(-g(x1+2*h)+8*g(x1+h)-8*g(x1-h)+g(x1-2*h))/(12*h)

K=10^2;
j=K;
undeter=zeros(K,1);
extrapol = zeros(K,1);
for i=K:-1:1
    h=i/10^6;
    x2 = x1-h;
    x3 = x1+h;
    t=@(a,b,c) [a+b+c, b*(x2-x1)+c*(x3-x1)-1,  b*(x2-x1)^2+c*(x3-x1)^2];
    [sola, solb, solc] = solve(t);
    undeter(j)= eval(sola*g(x1)+solb*g(x2)+solc*g(x3));
    extrapol(j)=(-g(x1+2*h)+8*g(x1+h)-8*g(x1-h)+g(x1-2*h))/(12*h);
    j=j-1;
end

plot(undeter)
hold on
plot(extrapol)


j=K;
undeter_err=zeros(K,1);
extrapol_err = zeros(K,1);
for i=K:-1:1
    h=i/10^6;
    x2 = x1-h;
    x3 = x1+h;
    t=@(a,b,c) [a+b+c, b*(x2-x1)+c*(x3-x1)-1,  b*(x2-x1)^2+c*(x3-x1)^2];
    [sola, solb, solc] = solve(t);
    undeter_err(j)= abs(4-eval(sola*g(x1)+solb*g(x2)+solc*g(x3)));
    extrapol_err(j)=abs(4-(-g(x1+2*h)+8*g(x1+h)-8*g(x1-h)+g(x1-2*h))/(12*h));
    j=j-1;
end
plot(undeter_err)
hold on
plot(extrapol_err)


