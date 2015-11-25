%load abf 2.0 files into matlab format
%version2.0 if baseline is at a slope (for traces recoreded very positive
%Vm). Correct the data trace with the slope first.
foname = 'E:\Data Analysis and records\nonquantal\ZY092415\';
%foname = 'E:\Data Analysis and records\nonquantal\ZY081015\axon1_8_minianalysis\'
cname = 'cd_ZY092415_0013';
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

%% search for the onset of the response
st = 5; % search step 5 pt a time
th = 3; % over 3 times the std+mean;
avg_array = mean(d(:,1,:),3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%version 2.0, correct d for the slope
avg_array = cor_slope(nq_on, avg_array);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nq_onset = Nq_Onset(avg_array, nq_on, nq_onr, st, th, ba);
%%search for the amplitude, change to the mid point
nq_amp = Nq_Amp(avg_array,nq_on,nq_onset,nq_off,ba);
%% search for the decay time; from light offset to 5% amp
be = 48000;
nq_decay = Nq_Decay(avg_array, nq_off, be, st);
% calculate the area of non-quantal response: start from onset to the 
all_area = Nq_Area(avg_array, ba,nq_on,nq_onset,nq_off,nq_decay,st);
%% calculate the area variation
num = size(d,3);
ea_area = ones(num,1);
for i = 1:num
    ea_area(i)= Nq_Area(d(:,1,i),ba,nq_on,nq_onset,nq_off,nq_decay,st);
end
st_ea_area = std(ea_area/10);
%% add these resulsts to the overall table
%% plot the trace
% negative non-quantal
nq_sta = [(nq_onset-nq_on)/10 nq_amp nq_decay/10 all_area st_ea_area];%
% positive non-quantal
%nq_sta = [(nq_onset-nq_on)/10 -nq_amp nq_decay/10 -all_area st_ea_area];
offset_start = 500;
offset_end= 1000;
nq_start= nq_on-offset_start;%padding for plot purpose
nq_end = nq_off+offset_end;%padding for plot pupose
%plot(d(nq_start:nq_end,1,1))%plot the non-quantal responses of trial 1
%% save for the pharmacology data
%saveloc = strcat(foname,cname,'Reversal','.mat');
%eval(strcat(cname,'.Rev','=nq_sta;'));
%save(saveloc,'-struct', eval('cname'));

