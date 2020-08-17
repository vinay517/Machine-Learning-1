%input data
a = fluML6(:, 14);
b = fluML6(:, 10);
c = fluML6(:,7);
%Normalizing data
x=a/max(a);
y=b/max(b);
z=c/max(c);
% initializing iterations and choosing theta and alpha values 
size = 10;
m = length(y);
theta = [0 -1 1].';
iterations = 500;
alpha = 0.01;
mat = [ones(m,1) x z];
%function for Gradient Descent and Cost Function
j=CalculatingCostMul(mat,y,theta);
[theta_mat ,jValues] = CalculatingGradientDescentMul(mat,y,theta,alpha,iterations);
%plotting graph between knowTrans risk and respetiq with hypothesis
figure;
scatter3(x, y,z, size, 'filled');
title('mapping of knowtrans to risk');
xlabel('knowtrans');
ylabel('risk');
zlabel('respetiq');
hold on;
h= -0.4937+(-0.2733*x)+ (0.5089 *z);
plot3(x,z, h);
%plotting 3d mesh graph for theta values and cost values 
figure;
triangulation = delaunay(theta_mat(:, 1), theta_mat(:,2));
trimesh(triangulation,theta_mat(:, 1), theta_mat(:,2), jValues);
title('mapping of theta to cost function');
xlabel('theta1');
ylabel('theta2');
zlabel('cost');
%plotting 3d line plot for theta values and cost values
figure;
plot3(theta_mat(:,1),theta_mat(:,2),jValues);
xlabel('theta1');
ylabel('theta2');
zlabel('cost');
% plotting a graph between iteration and cost function
figure;
iteration = 1:500;
plot(iteration,jValues);
title('graph for iteration and cost function');
xlabel('iteration');
ylabel('cost function');

