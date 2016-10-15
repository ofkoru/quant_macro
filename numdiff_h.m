
clear all
% directory
cd('C:\Users\ofkoru\Google Drive\Lectures\Quant_Macro\Numerical_Diff')
% symbolic variables
syms a

% function
f= @(x) x^2;
% symbolic function
g=  log(a+5)*a^2*exp(sqrt(a));
% symbolic diff
dg = diff(g);
display(dg);
% evaluation of diff at x=2
a=2;
eval(subs(dg))

% real value for diif of f at x=2
fp= 4;
K=10^2;
error = zeros(K,1);
h=0;
% error for h=1/10^10 to 1/10^12
error = zeros(K*2,1);
j=K*2;
for i =K:(-0.5):0.5
    h=i/10^12;
    error(j) = abs(fp - ((f(2+h) - f(2))/(h)));
    j=j-1;
end
x= 0.5:0.5:K;
x=x/10^12;
% plotting
plot(x, error)
print('error_diff_sqrt_x', '-djpeg')

% diff values
df =zeros(K*2,1);
j=K*2;
for i =K:(-0.5):0.5
   h=i/10^12; 
   df(j) =(f(2+h) - f(2))/(h);
   j=j-1;
end
plot(x, df)

print('diff_sqrt_x', '-djpeg')

