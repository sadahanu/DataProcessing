% copyright @Zhou Yu, zyu9@jhmi.edu, distribute under GPL license
% detect spikes, return a structure, each element contains spike timing in
% that trial
foname = 'E:\Data Analysis and records\nonquantal\ZY100915\';
%foname = 'E:\Data Analysis and records\nonquantal\ZY081015\axon1_8_minianalysis\'
cname = 'cd_ZY100915_0010';
finame = strcat(cname,'.abf');
fname = strcat(foname, finame);
d=abfload(fname);%d(:,1) currents - (Im_scaledZ); voltage - (10_Vm_Z)
%nq_on = 32342; % only for the recordings in May/2015
%nq_off = 42342; % only for the recordings in May/2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% light stimuli onset and offset parameters for 5s protocol
%nq_on = 10780;
%nq_onr = 11000;% search end for the onset
%nq_off = 20780;
%ba = 10580; % the baseline window 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% light stimuli onset and offset parameters for 8s protocol
%d(:,1,:)=-d(:,1,:);% for the positive events
nq_on = 11249;
nq_onr = 12500;
nq_off = 21249;
ba = 11000;
ln = 80000; % recording length
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
    %spike_detect = [ones(size(spike_detect),1).*i spike_detect];
    spiketime(i).timestamp = spike_detect;
    %if (i <2)
    %    spiketime = spike_detect;
    %else spiketime = [spiketime;spike_detect];
    %end
end
