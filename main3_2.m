% loading the pictures
pict=load('./pict.dat');
pict = reshape(pict, [1024,11])';


% preparation for the plotting of the figures
n = sqrt(length(pict));

xrange = linspace(0,1,n);
[xx1, xx2] = meshgrid(xrange,xrange);
XGrid = [xx1(:) xx2(:)];

% Computations
X=[pict(1,:); pict(2,:); pict(3,:)];
W = compute_weights(X);
pict_after = find_convergence(pict(11,:),W,0);

%Plotting
figure()   % plotting of the original figure
% hold on
g=gscatter(XGrid(:,1), XGrid(:,2), pict(1,:),[0.9 0.9 0.9;0.1 0.1 0.1]);
g(1).MarkerSize=30;
g(2).MarkerSize=30;
% 
% figure()  %plotting after the network
% hold on
% g=gscatter(XGrid(:,1), XGrid(:,2), pict_after,[0.9 0.9 0.9;0.1 0.1 0.1]);
% g(1).MarkerSize=30;
% g(2).MarkerSize=30;