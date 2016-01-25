function [x, u] = RK4_sys(f, tspan, u0, n)
a = tspan(1) ; b = tspan(2); h = (b-a)/n; x = (a : h : b)' ; u(1, :)= u0 ; 
for i = 1 : n
    k1 = h*feval(f, x(i), u(i, :) )';

    k2 = h*feval(f, x(i) + h/2, u(i, :) + k1/2)';

    k3 = h*feval(f, x(i) + h/2, u(i, :) + k2/2)'; 
    k4 = h*feval(f, x(i) + h, u(i, :) + k3)';
%    u(i+1, :) = k4;

    u(i+1, :) = u(i, :) + k1/6 + k2/3 + k3/3 + k4/6;
    
end
