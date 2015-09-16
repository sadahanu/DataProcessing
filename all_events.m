%% load the event 
filedelimiterIn = '\t';
headerlineIn = 0;
num = input('provide the number of files: ');
foldername = 'E:\Data Analysis and records\nonquantal\ZY060515\axon1_8_minianalysis\';
filename1 = 'cA_ZY060515_00'; % cell name
filetype='.ASC';
%cdata = zeros(1,6)
%du = 8000; % duration of each trial
%on_event = 1124.9; % can be 1078 if it is 5s duration
du = 5000;
on_event = 1078;
for i = 1:num
    fnu = input('provide the last one or two digits of the fitted data: ');
    filenum = num2str(fnu);
    filename = strcat(foldername,filename1, filenum, filetype);
    A = importdata(filename, delimiterIn, headerlineIn); %read ascII;
    % the event number and timing are readed as data array and text array
    sz = size(A.data,1); % the total number of events
    %a_area = sum(A.data(:,4)); % the total area of events
    % discompose the text area and extrac the event timing
    eventtime = ones(sz,1);
    ti_sta = zeros(1,3);
    for j = 1:sz
        ets = str2num(cell2mat(A.textdata(j,2)));%%
        eventtime(j) = ets(1)*1000+ets(2);
    end
    ti = [eventtime A.data(:,[1 4])]; % events extract from the current file
    [ti_sta(1) ti_sta(2) ti_sta(3)]  = all_event(ti,du,on_event); % extract the statistics as all area, std_area, first event
    if (i<2)
        edata = ti;
        esta = ti_sta;
    else
        edata = [edata;ti];
        esta = [esta;ti_sta];
    end
end