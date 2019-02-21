

for r = 1:4
    load(sprintf('run%d.mat',r));
    Level=level_id(:,1);
    Correc_id=correc_id(:,1);
    Targ1=target_id(:,1);
    Targ2=target_id(:,2);
    
    seq_data=table(Level,Correc_id,Targ1,Targ2);
    filename=sprintf('stim_run%d.csv',r-1);
    filename2=sprintf('run%d.csv',r-1);
    csvwrite(filename2,trial_sample);
    writetable(seq_data,filename);
end
