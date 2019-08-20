rhon=3.973;
rhod=0.181;
sigma=0.054;
%psi=0.046;
%psi=0.029;
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
%gamma=1;
gamma1=0.000343;
gamma2=0.000403;
gamma3=0.002976;
gamma4=0.32;
steps=100;
delta1=(1-1/6)/steps;
delta2=(0.046-0.029)/steps;
F=zeros(4,steps,steps);
M=zeros(steps,steps);

for j=1:steps
    
    psi = 0.029 + (j-1)*delta2;
    
    for i=1:steps
        gamma=1/6+(i-1)*delta1;
        
        A1=(1/25)*psi*rhon^2*sigma*(36*gamma^2-12*gamma+1)/((nuu*theta+mu)*iotan*NPT);
        A2=psi*sigma*(6*NPT*PPT^2*iotan*rhod^2+DT*PT*iotad*rhon^2)/(iotan*iotad*PT*NPT*DT*(nuu*theta+mu));
        
        F(1,j,i)=psi;
        F(2,j,i)=gamma;
        F(3,j,i)=A1;
        F(4,j,i)=A2;
        if A1>A2
            M(i,j)=1;
        end
    end
    
end

% plot(F(1,:),F(2,:),'r');
% hold on
% plot(F(1,:),F(3,:),'b');
% xlabel('gamma');
% ylabel('Eigenvalues');
% legend('GammaInvolved','NoGammaInvolved');
% title('psi=0.046');
find(M(:,:)>0)