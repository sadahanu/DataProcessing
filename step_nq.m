foname = 'E:\Data Analysis and records\nonquantal\ZY072315\';
finame = 'cE_ZY072315_0004.abf';
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
nq_on = 11249;
nq_onr = 12500;
nq_off = 21249;
ba = 11000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% search for the onset of the response
st = 5; % search step 5 pt a time
th = 3; % over 3 times the std+mean;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% return the responses amp; onset; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
num = size(d,3);
for i = 1:num
end