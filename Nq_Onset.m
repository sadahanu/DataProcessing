% search for the onset of the nonquantal response - used for the averaged
% data (avg_array). start: search start; en: search end; st:step-length:
% 10pt; move 5 pt each time; th:threshold: x times the std; baseline: 
function nq_on = Nq_Onset(avg_array, start, en, st, th, ba)
    % avg_array is 50000x1 double;
    bmean = mean(avg_array(ba:start)); % baseline mean, 20ms
    bstd = std(avg_array(ba:start))/sqrt(10); % baseline std of mean of 10 pts
    th = bmean - th*bstd;
    nq_on = -1;
    for i = start:st:en %st = should be 5
        wd = mean(avg_array(i:i+9));% average 10 pts everytime
        if wd<th
            nq_on=i+4;
            break
        end
    end