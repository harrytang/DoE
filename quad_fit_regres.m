% fitting a quad. model with the regres function
clear
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

% transforming into coded units
minmax=[min(X);max(X)];
X=code(X,minmax,1);

% constructing the design matrix with the
% intera function
X2=intera(X);
[b,yfit,stp,res,s,R2]=regres(X2,Y);

b
stp
R2

plotq(b,minmax);

pause;

% reduce the model
X3=intera(X,[],[],-2);  % you can do this by hand, too!
[b,yfit,stp,res,s,R2]=regres(X3,Y);

b
stp
R2

b2=[b(1:3);0;b(4);0];
plotq(b2,minmax);  % add zeros to account for missing quad terms
