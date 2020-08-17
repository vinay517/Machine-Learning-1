function j= CalculatingCostMul(mat,y,theta)
m=length(y);
h=mat*theta;
j=1/(2*m)*sum((h-y).^2);
end