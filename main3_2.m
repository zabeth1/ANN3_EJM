% loading the pictures
pict=load('./pict.dat');
pict = reshape(pict, [1024,11])';
nb_units = length(pict);

% preparation for the plotting of the figures
n = sqrt(length(pict));

xrange = linspace(1,0,n);
[xx1, xx2] = meshgrid(xrange,xrange);
XGrid = [xx1(:) xx2(:)];

%figure that we want
nb_fig = 1;
X_org = pict(nb_fig,:); %original picture

% Computations
X=[pict(1,:); pict(2,:); pict(3,:)];
W = compute_weights(X);
% pict_after = find_convergence(pict(nb_fig,:),W,0);
% pict_after = update_rule(X_org,W);

%random computations (for 3.3)
% W = randn(length(pict));
% W = 0.5*(W+W');
% X =sign(randn(1,length(pict)));
% pict_after = find_convergence(X,W,1);


% Measure of distortion (for 3.4)
rng(3);
range = 1:nb_units;
error = zeros(size(range));
for noise_per = range
    ind = randperm(length(1:nb_units), noise_per); %choose noise_per indices
    X = X_org;
    X(ind) = -X(ind);     %flip the number of this combination  
%     pict_after = find_convergence(X,W,0);
    pict_after = update_rule(X,W);
    error(noise_per) = sum(abs(pict_after - X_org))/2;
end
figure(1)
hold on
plot(linspace(1,100,length(range)),error);
set(gca,'FontSize',13)
xlabel('Percentage of noise')
ylabel('Number of wrong pixels')

%Plotting
% figure()
% g=gscatter(XGrid(:,1), XGrid(:,2), X_org,[0.9 0.9 0.9;0.1 0.1 0.1]);
% g(1).MarkerSize=30;
% g(2).MarkerSize=30;
% 
% % 
% figure()  %plotting after the network
% hold on
% g=gscatter(XGrid(:,1), XGrid(:,2), pict_after,[0.9 0.9 0.9;0.1 0.1 0.1]);
% g(1).MarkerSize=30;
% g(2).MarkerSize=30;
% title('final figure')