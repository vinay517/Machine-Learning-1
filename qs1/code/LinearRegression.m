%input data
x = fluML6(:,14)
y = fluML6(:,10)
% initializing iterations and choosing theta and alpha values 
m = length(x);
iterations = 500;
theta = [0 1].';
alpha = 0.01;
mat = [ones(m,1) x];
%function for Gradient Descent and Cost Function
[theta_mat1 ,jValues] = CalculatingGradientDescent1(mat,y,theta,alpha,iterations);
j=CalculatingCost1(mat,y,theta);
%plotting graph between knowTrans and risk with hypothesis
figure;
plot(x, y, 'mx');
title('mapping of knowtrans to risk');
xlabel('knowtrans');
ylabel('risk');
hold on
h = -0.0371 -(0.0261 *x);
plot(x,h);
hold on;
%placing the returned function values and concatenating them 
thetaValues=[theta_mat1 jValues];
theta1 = thetaValues(:,1);
theta2 = thetaValues(:,2);
%plotting 3d line plot for theta values and cost values
figure;
plot3(theta1, theta2, jValues);
xlabel('theta1');
ylabel('theta2');
zlabel('cost values');
%plotting 3d mesh graph for theta values and cost values  
figure;
triangulation = delaunay(theta1, theta2);
trimesh(triangulation,theta1, theta2, jValues);
title('mapping of theta to cost function');
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

