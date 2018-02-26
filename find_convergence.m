function [ Y ] = find_convergence( X,W , mode)
%UNTITLED6 Gives the convergence state in the network starting with X(X is
%a vector)
%   mode = 0 corresponds to a synchronous mode, and 1 to asynchronous

%preparation of the plotting
n = sqrt(length(X));
xrange = linspace(1,0,n);
[xx1, xx2] = meshgrid(xrange,xrange);
XGrid = [xx1(:) xx2(:)];

Y = X;
X=zeros(size(X));
cptr = 0; %counts the number of iterations
energy= [-Y*W*Y']; %energy of the system at each iteration
while any(X(:)~=Y(:)) && cptr < 10000
    X=Y;
    if mode == 0
        Y=update_rule(X,W);
        cptr= cptr + 1;
        energy= [energy;-Y*W*Y'];
    else
        for i = 1:1000
            Y = update_sequential(Y,W);
            if mod(cptr,100)==0
                g=gscatter(XGrid(:,1), XGrid(:,2),X,[0.9 0.9 0.9;0.1 0.1 0.1]);
                g(1).MarkerSize=30;
                g(2).MarkerSize=30;
                pause(0.001)
            end
            cptr= cptr + 1;
            energy= [energy;-Y*W*Y'];
        end
    end
      
end
% plot(energy)
end

