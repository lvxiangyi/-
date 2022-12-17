global counter
counter=0;

x0=[2;10];
% x=[0.1;0.2;3]
% y=[0.1;0.2;3]
[fmin,xmin]=SteepestDesDirMethod(x0)

counter
% x = linspace(0,3*pi,200);
% y = cos(x) + rand(1,200);  
% scatter(x,y)
% scatter([1 2 3],[4 5 6])