% graded responses; 
%for 0-20 (delta 2) or for 0-100(delta 10), the two stimulation modes
foname = 'E:\Data Analysis and records\nonquantal\ZY072315\';
%foname = 'E:\Data Analysis and records\nonquantal\ZY071715\axon1_8_minianalysis\'
cname = 'cE_ZY072315_0003';
finame = strcat(cname,'.abf');
fname = strcat(foname, finame);
d=abfload(fname);%d(:,1,:) currents - (Im_scaledZ); voltage - (10_Vm_Z)
%%% light stimuli onset and offset parameters for 5s protocol
nq_on = 10780;
nq_onr = 11000;% search end for the onset
nq_off = 20780;
ba = 10580; % the baseline window 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% light stimuli onset and offset parameters for 8s protocol
%d(:,1,:)=-d(:,1,:);% for current-clamp mode
%nq_on = 11249;
%nq_onr = 12500;
%nq_off = 21249;
%ba = 11000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% search for the onset of the response
st = 5; % search step 5 pt a time
th = 3; % over 3 times the std+mean;
%%% number of trials
num = size(d,3);
stat = zeros(5, num);
for i = 1:num
    stat(5,i)=  mean(d(ba:nq_on,1,i)); % baseline
    stat(1,i)= G_Nq_Amp(d(:,1,i),nq_on,nq_off,ba);% mid point amplitude(absolute)
    stat(3,i)= (Nq_Onset(d(:,1,i), nq_on, nq_onr, st, th, ba)-nq_on)/10; % onset
    [stat(4,i) stat(2,i)]= findrise95(d(:,1,i), nq_on, nq_onr, stat(5,i));
    stat(4,i)= (stat(4,i)-stat(3,i)*10-nq_on)/10;% rise time
    stat(2,i)= stat(2,i)-stat(5,i); % peak value
end
%% to correct for the current clamp recording
%stat(5,:) = -stat(5,:);
%stat(1,:) = -stat(1,:);
%stat(2,:) = -stat(2,:);
%%%%%%%%%%%%%%
saveloc = strcat(foname,cname,'gradeHC','.mat');
eval(strcat(cname,'.VCstat','=stat;')); %VC mode
%eval(strcat(cname,'.CCstat','=stat;')); % CCmode
save(saveloc,'-struct', eval('cname'));

    
    