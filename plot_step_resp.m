function plot_step_resp(K)
kp1=K(1);ki1=K(2);kd1=K(3);kp2=K(4);ki2=K(5);kd2=K(6);
% kp1=K(1);kp2=K(2);ki1=K(3);ki2=K(4);kd1=K(5);kd2=K(6);
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
sys=tf([a0-d0,a1-d1,a2-d2,a3-d3,a4],[a0,a1,a2,a3,a4])

step(sys)
fvtool([a0-d0,a1-d1,a2-d2,a3-d3,a4],[a0,a1,a2,a3,a4],'Analysis','polezero')
end