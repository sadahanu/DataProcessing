%load abf 2.0 files into matlab format
foname = 'E:\Data Analysis and records\nonquantal\ZY052515\';
finame = 'cB_ZY052515_0019.abf';
fname = strcat(foname, finame);
d=abfload(fname);%d(:,1) currents - (Im_scaledZ); voltage - (10_Vm_Z)
nq_on = 32342;
nq_off = 42342;
offset_start = 500;
offset_end= 1000;
nq_start= nq_on-offset_start;%padding for plot purpose
nq_end = nq_off+offset_end;%padding for plot pupose
plot(d(nq_start:nq_end,1))%plot the non-quantal responses

