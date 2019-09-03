%%R0 for the Nurse-Doctor Model

%Parameters
rhon=3.973;
rhod=0.181;
sigma=0.054;
psi=0.024;
theta=0.00949;
nuc=0;
nuu=1-nuc;
iotan=6.404;
iotad=1.748;
taun=2.728;
taud=0.744;
mu=0.002083;

%Conserved Values

DT=1;
NT=6;
PT=18;
NPT=1;
PPT=3;

%The values of the partials

dPdP=-theta*nuu-mu;
P1=dPdP;
dPdN=rhon*psi*PT/NT;
P2=dPdN;
dPdD=rhod*psi*PT/DT;
P3=dPdD;
dNdP=rhon*sigma*NT/PT;
N1=dNdP;
dNdN=-iotan;
N2=dNdN;
dNdD=0;
dDdP=rhod*sigma*DT/PT;
D1=dDdP;
dDdN=0;
dDdD=-iotad;
D3=dDdD;

%The Matrices

F=[[0, P2, P3];
   [0, 0, 0];
   [0, 0, 0]];

V=-[[P1, 0, 0];
    [N1, N2, 0];
    [D1, 0, D3]];

D=F*V^(-1);
eig(D)