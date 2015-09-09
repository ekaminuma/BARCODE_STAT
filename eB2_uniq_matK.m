function eB2_uniq_matK

x=fastaread('matK_rpsv.fasta');
N=size(x,1)
L=length(x(1).Sequence)
xnew=cell(1);

hit=1;
for nn=1:N
seq=x(nn).Sequence;
listN=strfind(seq,'N');
%listW=strfind(seq,'W');'K'
%listR=strfind(seq,'R');
%listY=strfind(seq,'Y');
if isempty(listN)==1   %%%&&  isempty(listW)==1  &&  isempty(listR)==1  &&  isempty(listY)==1
 fprintf('[%d:%d][%d]%s\n',nn,hit,length(seq),seq); 
 xnew(hit)=cellstr(seq);
 hit=hit+1;
end
end
N_ORG=size(xnew,2)
xnew_uniq=unique(xnew);
N_UNQ=size(xnew_uniq,2)

xratio=N_UNQ/N_ORG

out=zeros(N_UNQ,L);
for mm=1:N_UNQ
    tmpseq=char(xnew_uniq(mm));
    for pp=1:length(tmpseq)
       if strcmp(tmpseq(pp),'A')
           out(mm,pp)=1;
       elseif strcmp(tmpseq(pp),'C')
            out(mm,pp)=2;
       elseif strcmp(tmpseq(pp),'G')
           out(mm,pp)=3;
       elseif strcmp(tmpseq(pp),'T')
           out(mm,pp)=4;
       elseif strcmp(tmpseq(pp),'M')
           out(mm,pp)=5;
       elseif strcmp(tmpseq(pp),'R')
           out(mm,pp)=6;
       elseif strcmp(tmpseq(pp),'W')
           out(mm,pp)=7;
       elseif strcmp(tmpseq(pp),'S')
           out(mm,pp)=8;
       elseif strcmp(tmpseq(pp),'Y')
           out(mm,pp)=9;
       elseif strcmp(tmpseq(pp),'K')
           out(mm,pp)=10;
       elseif strcmp(tmpseq(pp),'V')
           out(mm,pp)=11;
       elseif strcmp(tmpseq(pp),'H')
           out(mm,pp)=12;
       elseif strcmp(tmpseq(pp),'D')
           out(mm,pp)=13;
       elseif strcmp(tmpseq(pp),'B')
           out(mm,pp)=14;    
           % m	a or c	amino r	a or g	purine w	a or t	 s	c or g	 y	c or t	pyrimidine k	g or t	keto
       else
           tmpseq(pp)
          error('?'); 
       end
    end
end

imagesc(out);



return
