% calculate the membrane condutance
%data: data array 1x ; Vd: voltage drop; start: start of the drop; end of
%the drop; window size
function y = Cal_gm(data, Vd, start, du, wd)
         gp = 50; % use a gap space as 10 ms
         mid = round(start + du/2);
         y1 = mean(data((start-gp):(start-gp+wd)));
         y2 = mean(data(mid:(mid+wd)));
         y = (y1-y2)/Vd; % unit pA/mV
       