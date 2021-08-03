function [c,ceq] = stability_test(K,x)
kp1=K(1);ki1=K(2);kd1=K(3);kp2=K(4);ki2=K(5);kd2=K(6);
Jm=2.5*10^-4;
kt=4.42*10^-2;
Bm=8.59*10^-5;
d0=Jm+kd2*kt;
d1=Bm+kp2*kt;
d2=kt*ki2;
d3=0;
a0=Jm+kd2*kt+kd1*kd2*kt; 
a1=Bm+kd2*kp1*kt+kp2*kt+kd1*kp2*kt;
a2=kd2*ki1*kt+ki2*kt+kd1*ki2*kt+kp1*kp2*kt;
a3=ki2*kp1*kt+ki1*kp2*kt;
a4=ki1*ki2*kt;
Os=vpasolve(d0*x^3+d1*x^2+d2*x+d3==0)
Poles=vpasolve(a0*x^4+a1*x^3+a2*x^2+a3*x+a4==0)
c = [real(Os(1));
     real(Os(2));
     real(Os(3));
     real(Poles(1));
     real(Poles(2));
     real(Poles(3));
     real(Poles(4));];
ceq = [];

end