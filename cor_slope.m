function cor_d = cor_slope(nqonset, avgarray)
  %% correct the avgArray use the 0-nqonset slope
  x = 1:nqonset;
  x = x';
  y = avgarray(1:nqonset);
  p = polyfit(x,y,1);
  cor_d = avgarray - polyval(p,[1:size(avgarray)]');