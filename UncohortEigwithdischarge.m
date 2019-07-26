rhon=3.973;
rhod=0.181;
sigma=0.054;
psi=0.1494;
mu=0.002083;
iotan=6.404;
iotad=1.748;
theta=0.00949;
F=[[0, rhon*psi*18/25 , rhod*psi*18/25];
    [0, 0, 0];
    [0, 0, 0]];
    
V = [[mu+theta, 0, 0];
     [-rhon*sigma*6/25, iotan, 0];
     [-rhod*sigma/25, 0, iotad]];

eig(F*V^(-1))