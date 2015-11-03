function y = inv_spikes(x)
 ints1 = diff(All_spikes);   % Interval values.
 y = ints1(ints1>=0);  % Eliminate the negative intervals at line ends