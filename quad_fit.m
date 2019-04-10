% fitting a quadratic model to data
clear all; close all;
addpath ./rstools

%%%%% The data:

X = [
    1   5.2 0
    1.7 5.2 0
    1   8.5 0
    1.7 8.5 0
    1   5.2 1
    1.7 5.2 1
    1   8.5 1
    1.7 8.5 1
    1   5.2 0   
    1.7 8.5 1
    1.7 5.2 0
    1.7 5.2 0
];

Y = [21 24 15 21 9 9 21 11 23 19 25 21]';

% construct the design matrix
n=length(Y);
%X2=[ones(n,1) X X(:,1).^2 X(:,1).*X(:,2) X(:,2).^2 ];
X2=intera(X);

b = X2\Y;
yfit=X2*b;

plot(1:n,Y,'o',1:n,yfit); hold on;

% statistical analysis
repmeas=[5 10 11];
sig=std(Y(repmeas));  % sigma estimate
cov_b=sig^2*inv(X2'*X2);  % cov matrix

% t-values
std_b=sqrt(diag(cov_b));
t_b=b./std_b

% reduce the model based on the t-values
X3 = X2(:,[1 2 3 5]);
b2 = X3\Y;
yfit2 = X3*b2;

cov_b2=sig^2*inv(X3'*X3);  % cov matrix

% t-values
std_b2=sqrt(diag(cov_b2));
t_b2=b2./std_b2

plot(1:n,yfit2,'r-');

% R2 values
R2_1 = 1-sum((Y-yfit).^2)/sum((Y-mean(Y)).^2)
R2_2 = 1-sum((Y-yfit2).^2)/sum((Y-mean(Y)).^2)