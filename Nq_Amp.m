%% calculate the mean amplitude of non-quantal responses
function nq_amp = Nq_Amp(avg_array,start,onset,offset,ba)
  bmean = mean(avg_array(ba:start)); % baseline mean, 20ms
  %nqmean = mean(avg_array(onset:offset)); % average from beginning to the
  %end
  nqmean = mean(avg_array((onset+5000):(onset+5500)));
  nq_amp = nqmean-bmean;