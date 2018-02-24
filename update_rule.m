function [ Y ] = update_rule( X,W )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
Y=sign(X*W);
Y(Y==0)=1;
end

