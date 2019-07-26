rho=4.154;
sigma=0.054;
mu=0.002083;
psi=0.1494;
iota=5.74;
theta=0.00949;
F=[[0 , rho*7*psi/(25)];
    [0, 0]];
V=[[mu+theta, 0];
    [-rho*sigma*18/25, iota]];
eig(F*V^(-1))