%State Variables
NumberOfYears=1;                        %Length of study
NumberOfSteps=NumberOfYears*365*24*60;  %Number of minutes in a year
NumberOfSimulations=1000;               %Number of Simulations you want to look through
MaxNumberOfAcquisitions=6;              %Highest number of acquisitions you want to count

%The Code
A=readtable('acq_trajFullSystem12.csv');
A=table2array(A);
F=zeros(MaxNumberOfAcquisitions,NumberOfSimulations);

for j=1:MaxNumberOfAcquisitions
    
   for i=1:NumberOfSimulations
       k=find(A(:,i)>=j,1);
       if ~isempty(k)
           if k<=(NumberOfSteps-1)
               F(j,i)=k;
           else
               k=k-(i-1)*(NumberOfSteps-1);
               F(j,i)=k;
            end
        else
           F(j,i)=NumberOfSteps;
        end
    end
    
end

csvwrite('AcqSurvivalFullSystem12.csv',F);
save('AcqSurvivalFullSystem12','F');

A=readtable('acq_trajFullSystem21.csv');
A=table2array(A);
F=zeros(MaxNumberOfAcquisitions,NumberOfSimulations);

for j=1:MaxNumberOfAcquisitions
    
   for i=1:NumberOfSimulations
       k=find(A(:,i)>=j,1);
       if ~isempty(k)
           if k<=(NumberOfSteps-1)
               F(j,i)=k;
           else
               k=k-(i-1)*(NumberOfSteps-1);
               F(j,i)=k;
            end
        else
           F(j,i)=NumberOfSteps;
        end
    end
    
end

csvwrite('AcqSurvivalFullSystem21.csv',F);
save('AcqSurvivalFullSystem21','F');

A=readtable('acq_trajNoColAdm12.csv');
A=table2array(A);
F=zeros(MaxNumberOfAcquisitions,NumberOfSimulations);

for j=1:MaxNumberOfAcquisitions
    
   for i=1:NumberOfSimulations
       k=find(A(:,i)>=j,1);
       if ~isempty(k)
           if k<=(NumberOfSteps-1)
               F(j,i)=k;
           else
               k=k-(i-1)*(NumberOfSteps-1);
               F(j,i)=k;
            end
        else
           F(j,i)=NumberOfSteps;
        end
    end
    
end

csvwrite('AcqSurvivalNoColAdm12.csv',F);
save('AcqSurvivalNoColAdm12','F');

A=readtable('acq_trajNoColAdm21.csv');
A=table2array(A);
F=zeros(MaxNumberOfAcquisitions,NumberOfSimulations);

for j=1:MaxNumberOfAcquisitions
    
   for i=1:NumberOfSimulations
       k=find(A(:,i)>=j,1);
       if ~isempty(k)
           if k<=(NumberOfSteps-1)
               F(j,i)=k;
           else
               k=k-(i-1)*(NumberOfSteps-1);
               F(j,i)=k;
            end
        else
           F(j,i)=NumberOfSteps;
        end
    end
    
end

csvwrite('AcqSurvivalNoColAdm21.csv',F);
save('AcqSurvivalNoColAdm21','F');