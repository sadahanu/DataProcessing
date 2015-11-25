%% analyze basal firing rate of gap-free file 
% note the gap-free mode has higher sampling rate (50 kHz vs. 10 khZ)
foname = 'E:\Data Analysis and records\nonquantal\ZY100915\';
%foname = 'E:\Data Analysis and records\nonquantal\ZY081015\axon1_8_minianalysis\'
cname = 'cd_ZY100915_0010';
finame = strcat(cname,'.abf');
fname = strcat(foname, finame);
d=abfload(fname,'start',0,'stop',150);%d(:,1) currents - (Im_scaledZ); voltage - (10_Vm_Z)
ln = size(d,1); % recording length, the gap free mode sampling rate is 50k Hz (Episode is 10 kHZ)) 
%% detection parameters:
swindow = 5; % search window size
num = size(d,3);
dir = 1;
for i = 1:num
    plot(d(:,1,i))
    point = ginput(1);
    thres = point(2); %% hand select the spike threshold
    spike_detect = 0;
    spike_detect = spike_detection(d(:,1,i),thres, swindow,ln);
end
base_ints = inv_spikes(spike_detect/5);
savelocation = strcat(foname,cname,'.mat');
cellname = strcat(cname,'spikes');
eval(strcat(cellname,'.timestamp','= spike_detect/5;'));
eval(strcat(cellname,'.interval', '= base_ints;'));
spike_sta = [length(spike_detect)/(ln/50000) std(base_ints)/mean(base_ints)];
eval(strcat(cellname,'.spikesta','=spike_sta'));
save(savelocation,'-struct', eval('cellname'))
