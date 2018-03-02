function [ W ] = compute_weights( X )
%UNTITLED4 Compute the weight matrix of the Hebbian network
%   NB: X is such that each row represents a pattern vector
rho=mean(mean(X));
% rho=0;
W = (X'-rho)*(X-rho);
W=W-eye(size(W)).*diag(W);

end

