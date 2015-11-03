%% calculate all events statistics:
% return a_area: totall area;
% return std_area: the variation of events in each trial
% return fevent: the timing of the first event in one trial during light response
function [a_area std_area fevent] = all_event(E,du,onset)
%du: duration; 

      sz = size(E,1); % the total number of events
      a_area = sum(E(:,3)); % the total area of events
      std_event = zeros(10,1); %(:,1) the area of EPSCs in the area; (:,2) the first event
      fi_event = zeros(10,1);
      trial = 0; % the current trial to handel
      for i = 1:sz
          if(fix((E(i,1)-onset)/du)> (trial-1))
              trial = trial+1; % tthe current trial number
              fi_event(trial)= mod(E(i,1),du)-onset; % the timing of the first event
          end
          std_event(trial)= std_event(trial)+ E(i,3);% add the area of the events
      end
     std_area = std(std_event(find(std_event~=0)));
     fevent = mean(fi_event(find(fi_event~=0)));
     std_event;
          
          
          