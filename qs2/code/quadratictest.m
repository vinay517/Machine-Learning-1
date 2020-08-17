x = fluML6(:, 14);
y = fluML6(:, 10);
z = x.^2
m = length(y);
h= -0.1785+(-0.0911*x) -(0.1138 *(z));
j=1/(2*m)*sum((h-y).^2);
figure;
plot3(x,z,h);
xlabel('x');
ylabel('z');
zlabel('h');
title('test graph for hypothesis');
