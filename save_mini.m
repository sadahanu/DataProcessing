%% save the data
% save the cdata(fitted): 1. amplitude; 2. Risetime; 3. Area 4. half
% duration, 5. decay, 6. R-sqr
% save the edata(all data): 1. timing; 2. amplitude; 3. area
% save the statistics of fitted data: fit_sta: [num_event avg_event avg_decay
% avg_area avg_rise]
% save the statistics of all events: esta: 1. all _area; 2. std_area/trial;
% 3. onset of the first events
savelocation = strcat(foldername,filename1,filenum,'.mat');
%save(savelocation, '-struct', 'cdata', 'edata','fit_sta','esta')
cellname = strcat(filename1,filenum);
eval(strcat(cellname,'.fitevents','= cdata;'));
eval(strcat(cellname,'.allevents', '= edata;'));
eval(strcat(cellname,'.fit_statistics','=fit_sta;'));
eval(strcat(cellname,'.allstatistics','=esta;'));
save(savelocation,'-struct', eval('cellname'))

