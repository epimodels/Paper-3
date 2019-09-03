%%R0 for the Metapopulation Model

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
dPdN=rhon*psi*PPT/NPT;
P2=dPdN;
dPdD=rhod*psi*PPT/DT;
P3=dPdD;
dNdP=rhon*sigma*NPT/PPT;
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
   %P1 P2 P3 P4 P5 P6 N1  N2 N3 N4 N5 N6 D
F=[[0, 0, 0, 0, 0, 0, P2, 0, 0, 0, 0, 0, P3];  %Patient1
   [0, 0, 0, 0, 0, 0, 0, P2, 0, 0, 0, 0, P3];  %Patient2
   [0, 0, 0, 0, 0, 0, 0, 0, P2, 0, 0, 0, P3];  %Patient3
   [0, 0, 0, 0, 0, 0, 0, 0, 0, P2, 0, 0, P3];  %Patient4
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, P2, 0, P3];  %Patient5
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, P2, P3];  %Patient6
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];    %Nurse1
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];    %Nurse2
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];    %Nurse3
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];    %Nurse4
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];    %Nurse5
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];    %Nurse6
   [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]];    %Doctor
     
     
V=-[[P1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];   %Patient1
   [0, P1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];    %Patient2
   [0, 0, P1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];    %Patient3
   [0, 0, 0, P1, 0, 0, 0, 0, 0, 0, 0, 0, 0];    %Patient4
   [0, 0, 0, 0, P1, 0, 0, 0, 0, 0, 0, 0, 0];    %Patient5
   [0, 0, 0, 0, 0, P1, 0, 0, 0, 0, 0, 0, 0];    %Patient6
   [N1, 0, 0, 0, 0, 0, N2, 0, 0, 0, 0, 0, 0];   %Nurse1
   [0, N1, 0, 0, 0, 0, 0, N2, 0, 0, 0, 0, 0];   %Nurse2
   [0, 0, N1, 0, 0, 0, 0, 0, N2, 0, 0, 0, 0];   %Nurse3
   [0, 0, 0, N1, 0, 0, 0, 0, 0, N2, 0, 0, 0];   %Nurse4
   [0, 0, 0, 0, N1, 0, 0, 0, 0, 0, N2, 0, 0];   %Nurse5
   [0, 0, 0, 0, 0, N1, 0, 0, 0, 0, 0, N2, 0];   %Nurse6
   [D1, D1, D1, D1, D1, D1, 0, 0, 0, 0, 0, 0, D3]]; %Doctor
   
D=F*V^(-1);
eig(D)
   
A1=psi*sigma*(6*PPT*iotan*rhod^2+PT*iotad*rhon^2)/(NPT*(nuu*theta+mu)*iotan*PT*iotad)

%Graphs of the eigenvalues
steps=1000;
K=zeros(3,steps);
gammamax=1;
gammamin=(1/6);
delta=(gammamax-gammamin)/steps;

for i=1:steps
    
gamma=(i-1)*delta+gammamin;
K(1,i)=gamma;
K(2,i)=psi*sigma*(6*PPT*iotan*rhod^2+PT*iotad*rhon^2)/(NPT*(nuu*theta+mu)*iotan*PT*iotad);
K(3,i)=(1/25)*psi*rhon^2*sigma*(36*gamma^2-12*gamma+1)/(NPT*(nuu*theta+mu)*iotan);

end

plot(K(1,:),K(2,:),'b');
hold on
plot(K(1,:),K(3,:),'r');
title('Eigenvalues for the Metapopulation Model Vs. Gamma');
xlabel('Gamma');
ylabel('Eigenvalue');