foname = 'E:\Data Analysis and records\nonquantal\ZY072315\';
%foname = 'E:\Data Analysis and records\nonquantal\ZY081015\axon1_8_minianalysis\'
cname = 'cE_ZY072315_0002';
finame = strcat(cname,'.abf');
fname = strcat(foname, finame);
d=abfload(fname);%d(:,1) currents - (Im_scaledZ); voltage - (10_Vm_Z)
avg_array = mean(d(:,1,:),3);
Rm_start = 12.62*50; % start point of the 10 mV jump; time gain is 50 in this case
Rm_du = 50*50;
Rm_bs = mean(avg_array(250:500));
Rm_val = mean(avg_array((Rm_start+Rm_du/2-100):(Rm_start+Rm_du/2+100)));
Rm_val = Rm_bs-Rm_val;
Rm = 10*10^(-3)/(Rm_val*(10^(-6)));