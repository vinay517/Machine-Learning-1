%input data
x = fluML6(:, 14);
y = fluML6(:, 10);
z = x.^2
%x=x/max(x);
%y=y/max(y);
%z=c/max(c);
% initializing iterations and choosing theta and alpha values 
size = 5;
m = length(y);
theta = [0 -1 1].';
iterations = 500;
alpha = 0.01;
mat = [ones(m,1) x z];
%function for Gradient Descent and Cost Function
j=ComputeCost1(mat,y,theta);
[theta_mat ,jValues] = GradientDescent1(mat,y,theta,alpha,iterations);
%plotting graph between knowTrans risk and squareKnowTrans with hypothesis
figure;
scatter3(x, z,y,'m.');
title('3d plot of KnowTrans Risk and squareKnowTrans');
xlabel('knowtrans');
ylabel('risk');
zlabel('squareknowtrans');
hold on;
title('hypothesis plot')
h= -0.2144+(-0.0879*x) -(0.1192 *(z));
plot3(x,z, h);
%plotting 3d mesh graph for theta values and cost values  
figure;
triangulation = delaunay(theta_mat(:, 1), theta_mat(:, 2));
trimesh(triangulation,theta_mat(:, 1), theta_mat(:, 2), jValues);
title('mapping of theta to cost function');
xlabel('theta1');
ylabel('theta2');
zlabel('cost');
%plotting 3d line plot for theta values and cost values
figure;
title('graph for theta values and cost');
plot3(theta_mat(:, 1), theta_mat(:, 2),jValues);
xlabel('theta1');
ylabel('theta2');
zlabel('cost')
% plotting a graph between iteration and cost function
figure;
iteration = 1:500;
plot(iteration,jValues);
title('graph for iteration and cost function');
xlabel('iteration');
ylabel('cost function');




