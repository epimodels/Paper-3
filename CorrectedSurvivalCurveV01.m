A=readtable('Con_trajAdmWOCol12.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(18,100);

for j=1:18
    
   for i=1:100
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

csvwrite('CorrectedAdmWOCol12.csv',F);
save('CorrectedAdmWOCol12','F');

A=readtable('Con_trajAdmWOCol21.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(18,100);

for j=1:18
    
   for i=1:100
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

csvwrite('CorrectedAdmWOCol21V2.csv',F);
save('CorrectedAdmWOCol21','F');

A=readtable('Con_trajFull.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(18,100);

for j=1:18
    
   for i=1:100
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

csvwrite('CorrectedFullSystemNoInitialColonizations.csv',F);
save('CorrectedFullSystemNoInitialColonizations','F');

A=readtable('Con_trajFull12.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(18,100);

for j=1:18
    
   for i=1:100
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

csvwrite('CorrectedFullSystem12.csv',F);
save('CorrectedFullSystem12','F');

A=readtable('Con_trajFull21.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(18,100);

for j=1:18
    
   for i=1:100
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

csvwrite('CorrectedFullSystem21.csv',F);
save('CorrectedFullSystem21','F');

A=readtable('Con_trajWOAdm12.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(18,100);

for j=1:18
    
   for i=1:100
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

csvwrite('CorrectedWOAdm12.csv',F);
save('CorrectedWOAdm12','F');

A=readtable('Con_trajWOAdm21.csv');
A=table2array(A);
%A=transpose(A);
F=zeros(18,100);

for j=1:18
    
   for i=1:100
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

csvwrite('CorrectedWOAdm21.csv',F);
save('CorrectedWOAdm21','F');