function [y,ystd,yostd]=predict(rsres,x)
%PREDICT predict new observations
% usage: YNEW = PREDICT(RESULT,XNEW), where RESULT is output from
% REG or RSREG run and XNEW is a matrix with same number of columns
% as in RSREG call.

[n,p]=size(x);

res=rsres.res;
int=res.intera;
intcept=res.intcept;
b = res.b;

if int == 1
  x = intera(x,[],[],-2);
elseif int==2
  x = intera(x);
elseif int==3
  x = intera3(x);
end

if intcept
  x = [ones(n,1),x];
end

y=x*b;

if nargout>1
  % prediction error for the mean
  ystd = sqrt(diag(x*inv(res.xtx)*x')).*res.rmse;
end

if nargout>2
  % prediction error for a new observation
  yostd = sqrt(ystd.^2 + res.rmse.^2);
end
