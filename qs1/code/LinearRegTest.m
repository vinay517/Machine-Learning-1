x = fluML6(:,14)
y = fluML6(:,10)

m=length(y);
h = -0.0371 -(0.0261 *x);
j=1/(2*m)*sum((h-y).^2);
figure;
plot(x,h);
xlabel('x');
ylabel('h');
title('test graph for hypothesis');
