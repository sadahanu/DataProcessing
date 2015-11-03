% find the 95% rise time for HC responses or the non-quantal response
% need to use the cursor to select the peak point
%nq_on: light onset
%nq_onr: onset range
function [risetime peak_val] = findrise95(avg_array, nq_on, nq_onr, baseline)
%% select the first peak value
% can be used negative going events
plot(avg_array(nq_on:(nq_onr+1000)))
peak = round(ginput(1));
peaktime = peak(1)+nq_on;
peak_val = mean(avg_array((peaktime-10):(peaktime+10))); % return the peak value
%% find the rise time as it cross 95% of first-peak amplitude.
st = 5; 
threshold = (peak_val-baseline)*0.95+baseline;
risetime = -1; % if there is no valid risetime found
for i = nq_on:st:peaktime
    wd = mean(avg_array(i:i+9));
    if wd<threshold
        risetime = i+4;
        break
    end
end