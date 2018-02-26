x1=[-1 -1 1 -1 1 -1 -1 1];
x2=[-1 -1 -1 -1 -1 1 -1 -1];
x3=[-1 1 1 -1 -1 1 -1 1];
X=[x1;x2;x3];

x1d=[ 1 -1 1 -1 1 -1 -1 1];
x2d=[ 1 1 -1 -1 -1 1 -1 -1];
x3d=[ 1 1 1 -1 1 -1 -1 -1];
Xd=[x1d;x2d;x3d];
rng(1);
W = compute_weights(X);
attractors=[];
for ii=1:10000
    x=sign(randn(1,8));
    y=find_convergence(x,W,0);
    if isempty(attractors) || not(ismember(y,attractors,'rows'))
        attractors = [attractors;y];
    end
end
attractors

% If we consider only -1,1 states we have 14 attractors, if we allow the
% states to be 0, we have 16 attractors. x and -x are all attractors of the
% network. 