constr={'B','F','H', 'J','L', 'M', 'Q', 'R', 'S', 'X','Y','Z'};
all_id=zeros(160,length(constr));
trial_id=[1:160];
for i = 1:160
    all_id(i,:)=randperm(length(constr));
end
load('optseq2_wm1902.mat');
a=[3:7];
% b=repmat(a,8,1);
% c=reshape(b,40,1);

correc_ness=[ones(20,1);ones(20,1).*2];

for r=1:4
   % tmp=randperm(40);
    tmp_correc=randperm(40);
    filename=sprintf('run%d.mat',r);
for i = 1:40
   % loc_id=tmp(i);
    level_id(i,1)=c(i);
    test_tmp=randperm(level_id(i,1));
    
    correc_id(i,1)=correc_ness(tmp_correc(i));
    if correc_id(i,1)==1
        target_id(i,:)=all_id(40*(r-1)+i,test_tmp([1 2]));
    else
        a=randperm(2);
        target_id(i,a(1))=all_id(40*(r-1)+i,test_tmp(1));
        target_id(i,a(2))=all_id(40*(r-1)+i,end);
    end
    
end
    trial_sample=all_id(40*(r-1)+1:40*r,:);
    eval(sprintf('save %s target_id trial_sample level_id constr all_id correc_id',filename));
    
end

   


