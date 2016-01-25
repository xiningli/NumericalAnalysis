%BVP y''=f(x,y,y') y(a)=ya h(y(b),y'(b))=0
%use secant rule for the error function : h(u(b),u'(b))=0
clear all
ya=1; a=0; b=1; max_it=10; tol=0.0001;
f=inline('[z(2),-2*z(1).*z(2)]','x','z');
h='z1 + z2 - 0.25';  %boundary condition
t(1)=0; t(2)=1; test=1; i=1; tspan=[a  b];
while(test>tol)&&(i<=max_it)
    if i>2
        t(i)=t(i-1)-(t(i-1)-t(i-2))*m(i-1)/(m(i-1)-m(i-2));
    end
    z0=[ya  t(i)];
    [x,z]=ode23( f, tspan, z0);
    [n  nn]=size(z); z1=z(n,1); z2=z(n,2);
    m(i)=eval(h); test=abs(m(i)); i=i+1;
end
[x,z], plot(x,z(:,1))
