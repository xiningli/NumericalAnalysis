f=inline('dz=[z(2);(-2*1000*(z(1)/2-0.3/2)*cos(asin(0.1/z(1))))/0.005]','t','z');
[t,z]=RK4_sys(f,[0,0.0035425],[0.6,0],10000);
hanshu=[t,z];
 plot(t, z(:,2),'b')
