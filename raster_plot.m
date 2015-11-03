% raster plot modified from
% http://www.neural-code.com/index.php/tutorials/brain/spike/59-spike-raster-plot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ntrials = numel(spiketime); % number of trials
for jj = 1:ntrials
    t       = spiketime(jj).timestamp; % Spike timings in the jjth trial
    nspikes   = numel(t); % number of elemebts / spikes
    for ii = 1:nspikes % for every spike
      line([t(ii) t(ii)],[jj-0.5 jj+0.5],'Color','k'); 
      % draw a black vertical line of length 1 at time t (x) and at trial jj (y)
  end
end
xlabel('Time (ms)'); % Time is in millisecond
ylabel('Trial number');
hold on
line([nq_on nq_off],[ntrials+1 ntrials+1],'Color','b','LineWidth',4)
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%plot the spike histogram
% choose duration of the trace; choose the bin size (default 2000 (0.2s))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
linetime = 80000; % for 8s recording trial
bw = 2000; % for a 0.2s time window
nbins = ceil(linetime/bw);
for ii = 1:ntrials
    if (ii <2)
        All_spikes = spiketime(ii).timestamp;
    else All_spikes = [All_spikes;spiketime(ii).timestamp];
    end
end
timv = bw/2:bw:nbins*bw+bw/2;  % time axis, bin centers, with an overflow
hist(All_spikes, timv);  % Make the PSTH, across all 10 trials
hold off
%pst = pst(1:end-1)'; 
%timv = timv(1:end-1)';  % Eliminate the overflow bin
%nevents = sum(pst);   % Count the events       and make column vectors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot the interspike interval distribution during the stimulus%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ints = inv_spikes(All_spikes);
maxint = max(ints)+50; % maximum interval included
%maxint = 10000;
intv = [bw/2:bw:round(maxint/bw)*bw + bw/2]';  % Abscissa of interval plot
hist(ints, intv);   % Make the interval histo (column vector)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot the interspike interval distribution outside the stimulus and inside
% stimulus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% sort the spikes to in-stimulus zone and out-stimulus zone
%count 5000 (500 ms) as decay time related spikes for spikes within
%stimulus
spikes_instim = All_spikes((All_spikes>nq_on)&(All_spikes<(nq_off+5000)));
ints_instim = 
%count  20000(2s) as decay time for spikes outside stimulus
spikes_outstim = All_spikes((All_spikes<nq_on)|(All_spikes>(nq_off+20000)));
% plot the interspike interval distribution outside the stimulus
