function [ X] = update_sequential( X,W )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
n = length(X);
i = floor(rand(1,1)*n)+1;
X(i) = sign(W(i,:)*X');
if X(i)==0
    X(i)=1;
end

