%load abf 2.0 files into matlab format
foname = 'E:\Data Analysis and records\nonquantal\ZY071615\';
%foname = 'E:\Data Analysis and records\nonquantal\ZY071715\axon1_8_minianalysis\'
cname = 'cD_ZY071615_0013';
finame = strcat(cname,'.abf');
fname = strcat(foname, finame);
d=abfload(fname);%d(:,1) currents - (Im_scaledZ); voltage - (10_Vm_Z)
%%% light stimuli onset and offset parameters for 5s protocol
%nq_on = 10780;
%nq_onr = 11000;% search end for the onset
%nq_off = 20780;
%ba = 10580; % the baseline window 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% light stimuli onset and offset parameters for 8s protocol
%d(:,1,:)=-d(:,1,:);% for current-clamp mode
nq_on = 11249;
nq_onr = 12500;
nq_off = 21249;
ba = 11000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% search for the onset of the response
st = 5; % search step 5 pt a time
th = 3; % over 3 times the std+mean;
avg_array = mean(d(:,1,:),3);
baseline = mean(avg_array(ba:nq_on));
HC_onset = Nq_Onset(avg_array, nq_on, nq_onr, st, th, ba);
%%search for the amplitude, change to the mid point
HC_amp = Nq_Amp(avg_array,nq_on,HC_onset,nq_off,ba);
%% search for the decay time; from light offset to 5% amp
be = 48000;
HC_decay = Nq_Decay(avg_array, nq_off, be, st);
%% Variance of mid point amplitude
%% calculate the amplitude variation
num = size(d,3);
ea_amp = ones(num,1);
for i = 1:num
    ea_amp(i)= Nq_Amp(d(:,1,i),nq_on,HC_onset,nq_off,ba);
end
st_ea_amp = std(ea_amp/10);
[risetime peak_amp] = findrise95(avg_array, nq_on, nq_onr, baseline);
%VC mode
HC_sta = [HC_amp peak_amp-baseline (HC_onset-nq_on)/10 (risetime-HC_onset)/10 HC_decay/10 st_ea_amp];

% CC mode
%HC_sta = [-HC_amp baseline-peak_amp (HC_onset-nq_on)/10 (risetime-HC_onset)/10 HC_decay/10 st_ea_amp -baseline];
%% save the parameters
saveloc = strcat(foname,cname,'HC','.mat');
eval(strcat(cname,'.steady_VCstat','=HC_sta;')); %VC mode

%eval(strcat(cname,'.steady_CCstat','=HC_sta;')); % CCmode
save(saveloc,'-struct', eval('cname'));


