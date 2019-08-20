rho=4.154;
sigma=0.054;
mu=0.002083;
psi=0.024;
iota=5.74;
theta=0.00949;
nuc=0;
nuu=1-nuc;
F=[[0 , rho*psi*18/7];
    [0, 0]];
V=[[mu+theta*(nuu), 0];
    [-rho*sigma*7/18, iota]];
eig(F*V^(-1))

A1=rho^2*psi*sigma/((nuu*theta+mu)*iota)