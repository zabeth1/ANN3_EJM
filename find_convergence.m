function [ Y ] = find_convergence( X,W , mode)
%UNTITLED6 Gives the convergence state in the network starting with X(X is
%a vector)
%   mode = 0 corresponds to a synchronous mode, and 1 to asynchronous

%preparation of the plotting
n = sqrt(length(X));
xrange = linspace(0,1,n);
[xx1, xx2] = meshgrid(xrange,xrange);
XGrid = [xx1(:) xx2(:)];
figure()
%hold on

Y = X;
X=zeros(size(X));
cptr = 0; %counts the number of iterations
while any(X(:)~=Y(:))
    X=Y;
    if mode == 0
        Y=update_rule(X,W);
    else
        for i = 1:100
            Y = update_sequential(Y,W);
        end
    
    
    disp(cptr)
    g=gscatter(XGrid(:,1), XGrid(:,2),X,[0.9 0.9 0.9;0.1 0.1 0.1]);
    g(1).MarkerSize=30;
    g(2).MarkerSize=30;
    pause(0.2)
    end
    
    cptr= cptr + 1;
    
end
if mode==1
    g=gscatter(XGrid(:,1), XGrid(:,2), Y,[0.9 0.9 0.9;0.1 0.1 0.1]);
    g(1).MarkerSize=30;
    g(2).MarkerSize=30;
    title('Final figure')
end
end

