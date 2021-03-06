%% search for a decay time of the non-quantal response
% decay is defined as the time point of offset (20780) to the % of the
% amplitude at the offset
% st: search length
% if the trace does not return to 5% of the amplitude in the end, return -1
function nq_decay = Nq_Decay(avg_array, offset, ba, st)
     bmean = mean(avg_array(ba:49000)); % baseline is set at the end of the file
     amp_offset = mean(avg_array(offset:(offset+10)));
     threshold = (amp_offset - bmean)*0.05+bmean;
     nq_decay = -1; 
     for i = offset:st:49000 %st = should be 5
        wd = mean(avg_array(i:i+9));% average 10 pts everytime
        if wd>threshold
            nq_decay=i+4 - offset;
            break
        end
    end
       
