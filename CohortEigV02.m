rhon=3.973;
rhod=0.181;
sigma=0.054;
psi=0.1494;
iotan=6.404;
iotad=1.748;
mu=0.002083;

F=[[0, 0, 0, 0, 0, 0, rhon*psi*3/5, 0, 0, 0, 0 ,0, rhod*psi*3/5];
   [0, 0 ,0, 0, 0, 0, 0, rhon*psi*3/5, 0, 0, 0, 0, rhod*psi*3/5];
   [0, 0, 0, 0, 0, 0, 0, 0, rhon*psi*3/5, 0, 0, 0, rhod*psi*3/5];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, rhon*psi*3/5, 0, 0, rhod*psi*3/5];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, rhon*psi*3/5, 0, rhod*psi*3/5];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, rhon*psi*3/5, rhod*psi*3/5];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];

V=[[mu, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, mu, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, mu, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, mu, 0, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, mu, 0, 0, 0, 0, 0, 0, 0, 0];
   [0, 0, 0, 0, 0, mu, 0, 0, 0, 0, 0, 0, 0];
   [-rhon*sigma/5, 0, 0, 0, 0, 0, iotan, 0, 0, 0, 0, 0, 0];
   [0, -rhon*sigma/5, 0, 0, 0, 0, 0, iotan, 0, 0, 0, 0, 0];
   [0, 0, -rhon*sigma/5, 0, 0, 0, 0, 0, iotan, 0, 0, 0, 0];
   [0, 0, 0, -rhon*sigma/5, 0, 0, 0, 0, 0, iotan, 0, 0, 0];
   [0, 0, 0, 0, -rhon*sigma/5, 0, 0, 0, 0, 0, iotan, 0, 0];
   [0, 0, 0, 0, 0, -rhon*sigma/5, 0, 0, 0, 0, 0, iotan, 0];
   [-rhod*sigma*3/25, -rhod*sigma*3/25, -rhod*sigma*3/25, -rhod*sigma*3/25, -rhod*sigma*3/25, -rhod*sigma*3/25, 0, 0, 0, 0, 0, 0, iotad]];

K=V^(-1);
D=F*K;
eig(D)