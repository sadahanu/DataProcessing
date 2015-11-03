% Import fitted event data from mini analysis

delimiterIn = '\t';
headerlineIn = 0;
num = input('provide the number of files: ');
foldername = 'E:\Data Analysis and records\nonquantal\ZY081015\axon1_8_minianalysis\';
filename1 = 'cB_ZY081015_000'; % cell name
filetype='.Fit';
%cdata = zeros(1,6);
for i = 1:num
    fnu = input('provide the last two digits of the fitted data: ');
    filenum = num2str(fnu);
    filename = strcat(foldername,filename1, filenum, filetype);
    A = importdata(filename, delimiterIn, headerlineIn); %read ascII
    if (i<2)
        adata = A.data(:,[1 4:7 12]);
    else
        adata = [adata;A.data(:,[1 4:7 12 2])];% the last colume is the timing of events
    end
end
% sort the adata to events within stimulation(cdata) and in control time
% (pdata)
% according to a data(:,7)
du = 8000; % duration of each trial
on_event = 1124.9; % can be 1078 if it is 5s duration
tail = 899.525;
%du = 5000;
%on_event = 1078; 


subplot(3,3,1)
hist(-cdata(:,1)) %plot the amplitude distribution
title('Amp: pA');
subplot(3,3,2)
hist(cdata(:,2)) %plot the area distribution
title('Rise: ms')
subplot(3,3,3)
hist(-cdata(:,3))% plot the rise time distribution
title('Area: pA.ms')
subplot(3,3,4)
hist(cdata(:,4))
title('Half-width: ms')
subplot(3,3,5)
hist(cdata(:,5))
title('Decay tau1: ms')
subplot(3,3,6)
plot(cdata(:,2),cdata(:,5),'o')
title('rise vs. decay')
subplot(3,3,7)
plot(cdata(:,5),-cdata(:,1),'o')
title('decay vs. Amp')
subplot(3,3,8)
plot(cdata(:,2),-cdata(:,1),'o')
title('rise vs. Amp')
gtext(filename1)
saveas(gcf,strcat(foldername,filename1, filenum,'.fig')); %% same the individual plot
%% return:fitted events for
num_event = size(cdata,1);% num_events: number of events during light stimulation
avg_event = mean(cdata(:,1));%: the mean amplitude of EPSCs
avg_decay = mean(cdata(:,5));%: EPSC decay;
avg_area = mean(cdata(:,3));%: EPSC area;
avg_rise = mean(cdata(:,2));% avg_rise: EPSC rise time;
fit_sta = [num_event avg_event avg_decay avg_area avg_rise];

            
        
            
            
  

 