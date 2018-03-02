function [ Y ] = update_rule( X,W ,theta)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if nargin==2
    Y=sign(X*W);
    Y(Y==0)=1;
else
    Y=0.5+0.5*sign(X*W-theta);
%     Y(Y==0)=1;
end
end

