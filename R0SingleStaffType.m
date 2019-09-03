%% R0 for the Single Staff Model %%

%Parameter Values
rho=4.154;     %HCW direct care tasks per hour
sigma=0.054;   %Hand contamination probability
psi=0.024;     %Successful colonization of patient probability
theta=0.00949; %Probability of discharge
nuc=0;         %Proportion of admissions colonized with MRSA
nuu=1-nuc;     %Proportion of uncolonized admissions
iota=5.74;     %HCW direct care tasks per hour with 56.55 compliance and 95 efficacy
tau=2.445;     %2.957 gown/glove changes per hour with 82.66 compliance
mu=0.002083;   %Natural decolonization rate median 20 days

%Conservations
ST=7;        %Total number of healtcare workers
PT=18;         %Total number of patients

%The values of the partials

dPdP=-theta*nuu-mu;
P1=dPdP;
dPdS=rho*psi*PT/ST;
P2=dPdS;
dSdP=rho*sigma*ST/PT;
S1=dSdP;
dSdS=-iota;
S2=dSdS;

%The Matrices

F=[[0, P2];
   [0, 0]];

V=-[[P1, 0];
   [S1, S2]];

D=F*V^(-1);
eig(D)