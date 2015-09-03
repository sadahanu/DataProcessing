% Import fitted event data from mini analysis

delimiterIn = '\t';
headerlineIn = 0;
num = input('provide the number of files: ');
foldername = 'E:\Data Analysis and records\nonquantal\ZY072315\axon1_8_minianalysis\';
filename1 = 'cE_ZY072315_000'; % cell name
filetype='.Fit';
%cdata = zeros(1,6);
for i = 1:num
    fnu = input('provide the last two digits of the fitted data: ');
    filenum = num2str(fnu);
    filename = strcat(foldername,filename1, filenum, filetype);
    A = importdata(filename, delimiterIn, headerlineIn); %read ascII
    if (i<2)
        cdata = A.data(:,[1 4:7 12]);
    else
        cdata = [cdata;A.data(:,[1 4:7 12])];
    end
end
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

            
        
            
            
  

 