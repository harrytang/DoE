% fitting a quad. model with the regres function

clear all; close all;
addpath ../doe_mfiles

%%%%% The data:

X = [100.0  2.0 
     220.0  2.0 
     100.0  4.0 
     220.0  4.0 
     75.1   3.0 
     244.8  3.0 
     160.0  1.5 
     160.0  4.4 
     160.0  3.0 
     75.1   3.0 
     75.1   3.0];

Y = [25.0 14.0 6.9  5.9 14.1 9.3  18.2  5.6  9.6  14.9 14.8]';

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
