% examples of different linear models (plane, plane+interactions,
% quadratic)
clear all; close all;
%addpath ../doe_mfiles
addpath ./rstools

% 1) just a plane

b=[1 0.5 1]';  % coefficients for the model
x1=linspace(-1,1); x2=linspace(-1,1);

[X1,X2]=meshgrid(x1,x2);
X=[ones(numel(X1),1) X1(:) X2(:)];

y=X*b;
Y=reshape(y,length(x1),length(x2));
figure;
surf(X1,X2,Y);

% 2) plane + interactions
b=[1 1 1 1]';
X=[X X1(:).*X2(:)];
y=X*b;
Y=reshape(y,length(x1),length(x2));
figure;
surf(X1,X2,Y);

% 3) full quadratic
b=[1 1 1 1 1 1]';
X=[X X1(:).^2 X2(:).^2];
y=X*b;
Y=reshape(y,length(x1),length(x2));
figure;
surf(X1,X2,Y);