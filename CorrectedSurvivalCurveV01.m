A=readtable('acq_trajAdm12.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(6,1000);

for j=1:6
    
   for i=1:1000
       k=find(A(:,i)>=j,1);
       if ~isempty(k)
           if k<=8759
               F(j,i)=k;
           else
               k=k-(i-1)*8759;
               F(j,i)=k;
            end
        else
           F(j,i)=8760;
        end
    end
    
end

csvwrite('AcqSurvivalWithAdm12.csv',F);
save('AcqSurvivalWithAdm12','F');

A=readtable('acq_trajAdm21.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(6,1000);

for j=1:6
    
   for i=1:1000
       k=find(A(:,i)>=j,1);
       if ~isempty(k)
           if k<=8759
               F(j,i)=k;
           else
               k=k-(i-1)*8759;
               F(j,i)=k;
            end
        else
           F(j,i)=8760;
        end
    end
    
end

csvwrite('AcqSurvivalWithAdm21.csv',F);
save('AcqSurvivalWithAdm21','F');

A=readtable('acq_trajFullSystem12.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(6,1000);

for j=1:6
    
   for i=1:1000
       k=find(A(:,i)>=j,1);
       if ~isempty(k)
           if k<=8759
               F(j,i)=k;
           else
               k=k-(i-1)*8759;
               F(j,i)=k;
            end
        else
           F(j,i)=8760;
        end
    end
    
end

csvwrite('AcqSurvivalFullSystem12.csv',F);
save('AcqSurvivalFullSystem12','F');

A=readtable('acq_trajFullSystem21.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(6,1000);

for j=1:6
    
   for i=1:1000
       k=find(A(:,i)>=j,1);
       if ~isempty(k)
           if k<=8759
               F(j,i)=k;
           else
               k=k-(i-1)*8759;
               F(j,i)=k;
            end
        else
           F(j,i)=8760;
        end
    end
    
end

csvwrite('AcqSurvivalFullSystem21.csv',F);
save('AcqSurvivalFullSystem21','F');

A=readtable('acq_trajFullSystemNoInitial.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(6,1000);

for j=1:6
    
   for i=1:1000
       k=find(A(:,i)>=j,1);
       if ~isempty(k)
           if k<=8759
               F(j,i)=k;
           else
               k=k-(i-1)*8759;
               F(j,i)=k;
            end
        else
           F(j,i)=8760;
        end
    end
    
end

csvwrite('AcqSurvivalFullSystemNoInitial.csv',F);
save('AcqSurvivalFullSystemNoInitial','F');

A=readtable('acq_trajWOAdm12.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(6,1000);

for j=1:6
    
   for i=1:1000
       k=find(A(:,i)>=j,1);
       if ~isempty(k)
           if k<=8759
               F(j,i)=k;
           else
               k=k-(i-1)*8759;
               F(j,i)=k;
            end
        else
           F(j,i)=8760;
        end
    end
    
end

csvwrite('AcqSurvivalWOAdm12.csv',F);
save('AcqSurvivalWOAdm12','F');

A=readtable('acq_trajWOAdm21.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(6,1000);

for j=1:6
    
   for i=1:1000
       k=find(A(:,i)>=j,1);
       if ~isempty(k)
           if k<=8759
               F(j,i)=k;
           else
               k=k-(i-1)*8759;
               F(j,i)=k;
            end
        else
           F(j,i)=8760;
        end
    end
    
end

csvwrite('AcqSurvivalWOAdm21.csv',F);
save('AcqSurvivalWOAdm21','F');