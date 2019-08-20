rhon=3.973;
rhod=0.181;
sigma=0.054;
%psi=0.046;
%psi=0.029;
%psi=0.1494;
psi=0.024;
iotan=6.404;
iotad=1.748;
mu=0.002083;
theta=0.00949;
nuc=0;
nuu=1-nuc;
PPT=3;
PT=18;
NPT=1;
NT=6;
DT=1;
gamma=(1/6);
gamma1=0.000343;
gamma2=0.000403;
gamma3=0.002976;
gamma4=0.32;
F=[[0, 0, 0, 0, 0, 0, rhon*psi*PPT/NPT, 0, 0, 0, 0, 0, rhod*psi*PPT/DT];
   [0, 0 ,0, 0, 0, 0, 0, rhon*psi*PPT/NPT, 0, 0, 0, 0, rhod*psi*PPT/DT];
   [0, 0, 0, 0, 0, 0, 0, 0, rhon*psi*PPT/NPT, 0, 0, 0, rhod*psi*PPT/DT];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, rhon*psi*PPT/NPT, 0, 0, rhod*psi*PPT/DT];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, rhon*psi*PPT/NPT, 0, rhod*psi*PPT/DT];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, rhon*psi*PPT/NPT, rhod*psi*PPT/DT];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

V=[[mu+theta*nuu, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, mu+theta*nuu, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, mu+theta*nuu, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, mu+theta*nuu, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, mu+theta*nuu, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, mu+theta*nuu, 0, 0, 0, 0, 0, 0, 0];
   [-rhon*sigma/PPT, 0, 0, 0, 0, 0, iotan, 0, 0, 0, 0, 0, 0];
   [0, -rhon*sigma/PPT, 0, 0, 0, 0, 0, iotan, 0, 0, 0, 0, 0];
   [0, 0, -rhon*sigma/PPT, 0, 0, 0, 0, 0, iotan, 0, 0, 0, 0];
   [0, 0, 0, -rhon*sigma/PPT, 0, 0, 0, 0, 0, iotan, 0, 0, 0];
   [0, 0, 0, 0, -rhon*sigma/PPT, 0, 0, 0, 0, 0, iotan, 0, 0];
   [0, 0, 0, 0, 0, -rhon*sigma/PPT, 0, 0, 0, 0, 0, iotan, 0];
   [-rhod*sigma*PPT/PT, -rhod*sigma*PPT/PT, -rhod*sigma*PPT/PT, -rhod*sigma*PPT/PT, -rhod*sigma*PPT/PT, -rhod*sigma*PPT/PT, 0, 0, 0, 0, 0, 0, iotad]];

K=V^(-1);
D=F*K;
eig(D)

A1=(1/25)*psi*rhon^2*sigma*(36*gamma^2-12*gamma+1)/((nuu*theta+mu)*iotan*NPT)
A2=psi*sigma*(6*NPT*PPT^2*iotan*rhod^2+DT*PT*iotad*rhon^2)/(iotan*iotad*PT*NPT*DT*(nuu*theta+mu))

A11=psi*sigma*(DT*PT*iotad*rhon^2+6*PPT^2*iotan*rhod^2)/((nuu*theta+mu)*iotan*DT*PT*iotad)
%A21=rhon^2*psi*sigma/((nuu*theta+mu)*iotan))

