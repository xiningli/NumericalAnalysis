function z = Heat_Exp( f, g0, g1, T, n, m ,c )
%HEAT_EXP Summary of this function goes here
%   Detailed explanation goes here

h=1/n;
k=T/m;
r=c*k/h^2;
s= 1 - 2*r;
x= 0:h:1;
t=0:k:T;

u(1:n+1, 1) = f(x)';
u(1, 1:m+1) = g0(t);
u( n+1, 1:m+1) = g1(t);
for j= 1:m
    u(2:n, j+1) = r*u(1:n-1, j) + s*u(2:n, j) + r*u(3:n+1, j);
end

z= u';
mesh(x, t, z)
x;
t;
z;
end
