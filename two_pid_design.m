function val=two_pid_design(K)
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

A=d3^2/(4*a4^2);

Z1=2*a4*d0^2+2*a0*(d2^2-2*d1*d3)+a2*(d1^2-2*d0*d2)+...
    a1*(d1*d2-3*d0*d3)+a3*d0*d1+...
    (a1*a2-a0*a3)*d2*d3/a4+d3^2/a4*(a0*a2+a1^2);
N1=2*(a1*a2*a3-a0*a3^2-a1^2*a4);
B=Z1/N1;

Z2=(a3^2*d0^2+a1^2*(d2^2-2*d1*d3)+...
    a1*a3*(d1^2-2*d0*d2)+a1/a4*(a1*a2-a0*a3)*d3^2)...
    *(a1*a3-4*a0*a4+a2^2);
N2=2*(a1*a2*a3-a0*a3^2-a1^2*a4)^2;
C=Z2/N2;
val=A-B+C;
end
