%% save the spike analysis results under the cell name.
savelocation = strcat(foname,cname,'.mat');
%save(savelocation, '-struct', 'cdata', 'edata','fit_sta','esta')
cellname = strcat(cname,'spikes');
eval(strcat(cellname,'.timestamp','= spiketime;'));
eval(strcat(cellname,'.allspikes', '= All_spikes;'));
eval(strcat(cellname,'.instimulus','=spikes_instim;'));
eval(strcat(cellname,'.outstimulus','=spikes_oustim;'));
% also save the non-quantal results
eval(strcat(cellname,'.ininterval','=ints_instim'));
eval(strcat(cellname,'.outinterval','=ints_oustim;'));
eval(strcat(cellname,'.allinterval','=ints;'));
spike_sta = [length(All_spikes)/(linetime/10000*10) std(ints)/mean(ints) length(spikes_instim)/(1.5*10) std(ints_instim)/mean(ints_instim) length(spikes_oustim)/(5*10) std(ints_oustim)/mean(ints_oustim)];
eval(strcat(cellname,'.spikesta','=spike_sta'));
save(savelocation,'-struct', eval('cellname'))