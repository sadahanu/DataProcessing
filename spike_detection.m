%detect spiking timing; arr_nq: axon trace; thr: threshold; search: search
%window size
function y = spike_detection(arr_nq, thr,search,len)
   y = -1 ; % initial value -1; change to array if spikes detected
   i = search+1;
   while (i < (len-search))
       if (mean(arr_nq((i-search):i))<thr)&(mean(arr_nq((i:i+search))>thr)) % find the first cross point
          if ((i+1000)>(len-search))
              kk = len-search;
          else kk = i+1000;
          end
           for j = (i+search):search:kk % find the return cross point
             if(mean(arr_nq((j-search):j))>thr)&(mean(arr_nq(j:j+search))< thr)
                 break;
             end
         end
         %spike happens between i and j
         [value,peak]=max(arr_nq(i:j));
         if (y<0)
             y = peak+i;
         else y=[y;(peak+i)];
         end
         i = j; % jump the search to the spike end j
       else i = i+search;
       end
   end
   