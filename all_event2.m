%% calculate all events statistics:
%E: nx3 array: 1: timing; 2. Amplitude; 3. Area, 
%du: duration of a trial; onset: light onset; tail: decay time included for
%identifying events within stimuli
% return a_area: totall area;
% return s_area: area of events during stimulation
% return std_area: the variation of events in each trial only during stimulation
% return fevent: the timing of the first event in one trial during light response
% return clevent: number of events not in the stimulation range
function [clevent sevent a_area s_area std_area fevent] = all_event2(E,du,onset,tail)
% version 09/20/15 distinguish events inside/outside range
% test - start from VgluT3 events
      sz = size(E,1); % the total number of events
      a_area = sum(E(:,3)); % the total area of events
      std_event = zeros(10,1); %(:,1) the area of EPSCs in the area; (:,2) the first event
      fi_event = zeros(10,1); % zeros (k,1), k: the total trial number;
      ssevent = zeros(10,1); % the number of events within the stimulation
      trial = 0; % the current trial to handel
      for i = 1:sz
          if(fix((E(i,1)-onset)/du)> (trial-1))
              trial = trial+1; % tthe current trial number
              fi_event(trial)= mod(E(i,1),du)-onset; % the timing of the first event
          end
          ti = mod((E(i,1)-onset),du); % timing relevant to stimulus onset
          if ti<1000+tail % if events happen within the stimulation time
             std_event(trial)= std_event(trial)+ E(i,3);% add the area of the events
             ssevent(trial)= ssevent(trial)+1;
          end
      end
     s_area = sum(std_event);
     sevent = sum(ssevent);
     clevent = sz - sevent;
     std_area = std(std_event(find(std_event~=0)));
     fevent = mean(fi_event(find(fi_event~=0)));
          