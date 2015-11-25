foname = 'E:\Data Analysis and records\nonquantal\ZY101115\';
cname = 'cA_ZY101115_0026';
finame = strcat(cname,'.abf');
fname = strcat(foname, finame);
d=abfload(fname);%d(:,1) currents - (Im_scaledZ); voltage - (10_Vm_Z)
step = 500; % the voltage step is 50 ms
Vd = 5; % the voltage jump is 5 mV.
num = size(d,3); % the number of trials
start_t = [3249 5749 14249 16749];
%start_t = 3249;
Gm = zeros(10,4);
wd = 50; % 5 ms average as a data point
for i = 1:num
    Gm(i,1)=Cal_gm(d(:,1,i),Vd,start_t(1),step,wd);
    Gm(i,2)=Cal_gm(d(:,1,i),Vd,start_t(2),step,wd);
    Gm(i,3)=Cal_gm(d(:,1,i),Vd,start_t(3),step,wd);
    Gm(i,4)=Cal_gm(d(:,1,i),Vd,start_t(4),step,wd);
    
end
    