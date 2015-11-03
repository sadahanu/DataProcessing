%% calculate the mean amplitude of non-quantal responses
function nq_amp = G_Nq_Amp(avg_array,onset,offset,ba)
  bmean = mean(avg_array(ba:onset)); % baseline mean, 20ms
  %nqmean = mean(avg_array(onset:offset)); % average from beginning to the
  %end
  nqmean = mean(avg_array((onset+5000):(onset+5500)));
  nq_amp = nqmean-bmean;