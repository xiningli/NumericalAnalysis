function [x, y] = AB3_RK3(f, y0, tspan, n)
a=tspan(1); b = tspan(2);   h = (b-a)/n;    k = h/12;
x = (a : h : b);    y(1)=y0;
for i = 1:2
    z(i) = f(x(i),y(i));
    k1 = h*z(i);
    k2 = h*f(x(i)+0.5*h, y(i) + 0.5 *k1);
    k3 = h*f(x(i)+0.75*h, y(i) + 0.75*k2);
    y(i+1) = y(i) + (2*k1+3*k2+4*k3)/9;
end
for i=3:n
    z(i) = f(x(i),y(i));
    y(i+1) = y(i) + k*(23*z(i)-16*z(i-1)+5*z(i-2));
end
