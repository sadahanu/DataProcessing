%% calculate the area of non-quantal responses
% baseline start
%start: light start
%onset: reaponse onset
%decay: decay time
%st the step length
function all_area = Nq_Area(avg_array, ba,start, onset,off,decay,st)
   bmean = mean(avg_array(ba:start)); % baseline mean, 20ms
   all_area = 0;
   for i = onset:st:(off+decay) %st = should be 5
     all_area = all_area+(mean(avg_array(i:i+st-1))-bmean)*st;
   end
     
   
