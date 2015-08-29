%load abf 2.0 files into matlab format
foname = 'E:\Data Analysis and records\nonquantal\ZY061015\';
finame = 'ce_ZY061015_0006.abf';
fname = strcat(foname, finame);
d=abfload(fname);%d(:,1) currents - (Im_scaledZ); voltage - (10_Vm_Z)
%nq_on = 32342; % only for the recordings in May/2015
%nq_off = 42342; % only for the recordings in May/2015
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% light stimuli onset and offset
nq_on = 10780;
nq_onr = 11000;% search end for the onset
nq_off = 20780;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% search for the onset of the response
st = 5; % search step 5 pt a time
th = 3; % over 3 times the std+mean;
ba = 10580; % the baseline window 
avg_array = mean(d(:,1,:),3);
nq_onset = Nq_Onset(avg_array, nq_on, nq_onr, st, th, ba);
%%search for the amplitude, change to the mid point
nq_amp = Nq_Amp(avg_array,nq_on,nq_onset,nq_off,ba)
%% plot the trace
offset_start = 500;
offset_end= 1000;
nq_start= nq_on-offset_start;%padding for plot purpose
nq_end = nq_off+offset_end;%padding for plot pupose
%plot(d(nq_start:nq_end,1,1))%plot the non-quantal responses of trial 1

