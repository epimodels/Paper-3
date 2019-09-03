rhon=3.973;
rhod=0.181;
sigma=0.054;
psi=0.024;
%psi=0.029;
%psi=0.046;
mu=0.002083;
iotan=6.404;
iotad=1.748;
theta=0.00949;
nuc=0;
nuu=1-nuc;
PT=18;
NT=6;
DT=1;
F=[[0, rhon*psi*PT/NT , rhod*psi*PT/DT];
    [0, 0, 0];
    [0, 0, 0]];
    
V = [[mu+theta*nuu, 0, 0];
     [-rhon*sigma*NT/PT, iotan, 0];
     [-rhod*sigma*DT/PT, 0, iotad]];
D=F*(V^(-1));
eig(D)
eig(F*(V^(-1)))

A1=psi*sigma*(DT*iotad*rhon^2+iotan*rhod^2)/((theta*nuu+mu)*iotan*DT*iotad)