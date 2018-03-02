function [ X] = update_sequential( X,W,theta )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

    n = length(X);
    i = floor(rand(1,1)*n)+1;
if nargin==2
    X(i) = sign(W(i,:)*X');
    if X(i)==0
        X(i)=1;
    end
else
      X(i) = 0.5+0.5*sign(W(i,:)*X'-theta);
end


end

