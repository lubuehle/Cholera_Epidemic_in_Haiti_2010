function video(infected_cal,suspected_cal,removed_cal)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Infected %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Load Data &colormaps   
load data
load map/color

% Load the districts
load map/map
load map/contur
load map/cut

%Prepare cal & data
new=[infected_data(:);infected_cal(:)];
e=quantile(new,[.05, 0.95]);
infected_data(infected_data > e(1,2))=e(1,2);
infected_data(infected_data < e(1,1))=e(1,1);
infected_cal(infected_cal > e(1,2))=e(1,2);
infected_cal(infected_cal < e(1,1))=e(1,1);

legend=linspace(e(1,1),e(1,2),11);
m=57/(e(1,2)-e(1,1));
q=62-(m*e(1,2));
cal=infected_cal*m+q;
data=infected_data*m+q;
[~, t] = size(data);

% Video befehle
scrsz = get(0,'ScreenSize');
myfig=figure('Position',[(scrsz(3)-1012)/2 (scrsz(4)-369)/2 1012 369]); 
figure(myfig);
set(gca,'NextPlot','replacechildren');

writerObj = VideoWriter('infected.avi','Uncompressed AVI');
writerObj.FrameRate = 6;
open(writerObj);

% Axis
axis off
axis equal
ylim([0 1400])
xlim([0 3846])

%Colormap
colormap(mycmap_infected);

%Reclassify the map
for l=1:t;
   noq_cal=cal(6,l)*nordquest;     % nordquest
   no_cal=cal(5,l)*nord;           % nord
   ar_cal=cal(1,l)*artibonite;     % artibonite     
   noest_cal=cal(7,l)*nordest;     % nordest
   ce_cal=cal(2,l)*centre;         % centre   
   ou_cal=cal(8,l)*ouest;          % ouest     
   suest_cal=cal(10,l)*sudest;      % sudest 
   su_cal=cal(9,l)*sud;            % sud 
   ni_cal=cal(4,l)*nippes;         % nippes   
   gr_cal=cal(3,l)*grandanse;     % grandanse

   noq_data=data(6,l)*nordquest;     % nordquest
   no_data=data(5,l)*nord;           % nord
   ar_data=data(1,l)*artibonite;     % artibonite     
   noest_data=data(7,l)*nordest;     % nordest
   ce_data=data(2,l)*centre;         % centre   
   ou_data=data(8,l)*ouest;          % ouest     
   suest_data=data(10,l)*sudest;      % sudest 
   su_data=data(9,l)*sud;            % sud 
   ni_data=data(4,l)*nippes;         % nippes   
   gr_data=data(3,l)*grandanse;     % grandanse

%Place the Puzzle-Pieces
con = contur;
con(cut(1,1):cut(1,2),cut(1,3):cut(1,4))      =con(cut(1,1):cut(1,2),cut(1,3):cut(1,4))+ noq_cal;
con(cut(2,1):cut(2,2),cut(2,3):cut(2,4))      =con(cut(2,1):cut(2,2),cut(2,3):cut(2,4))+ no_cal;
con(cut(3,1):cut(3,2),cut(3,3):cut(3,4))      =con(cut(3,1):cut(3,2),cut(3,3):cut(3,4))+ ar_cal;
con(cut(4,1):cut(4,2),cut(4,3):cut(4,4))      =con(cut(4,1):cut(4,2),cut(4,3):cut(4,4))+ noest_cal;
con(cut(5,1):cut(5,2),cut(5,3):cut(5,4))      =con(cut(5,1):cut(5,2),cut(5,3):cut(5,4))+ ce_cal;
con(cut(6,1):cut(6,2),cut(6,3):cut(6,4))      =con(cut(6,1):cut(6,2),cut(6,3):cut(6,4))+ ou_cal;
con(cut(7,1):cut(7,2),cut(7,3):cut(7,4))      =con(cut(7,1):cut(7,2),cut(7,3):cut(7,4))+ suest_cal;
con(cut(8,1):cut(8,2),cut(8,3):cut(8,4))      =con(cut(8,1):cut(8,2),cut(8,3):cut(8,4))+ su_cal;
con(cut(9,1):cut(9,2),cut(9,3):cut(9,4))      =con(cut(9,1):cut(9,2),cut(9,3):cut(9,4))+ ni_cal;
con(cut(10,1):cut(10,2),cut(10,3):cut(10,4))  =con(cut(10,1):cut(10,2),cut(10,3):cut(10,4))+gr_cal;

con(cut(11,1):cut(11,2),cut(11,3):cut(11,4))      =con(cut(11,1):cut(11,2),cut(11,3):cut(11,4))+ noq_data;
con(cut(12,1):cut(12,2),cut(12,3):cut(12,4))      =con(cut(12,1):cut(12,2),cut(12,3):cut(12,4))+ no_data;
con(cut(13,1):cut(13,2),cut(13,3):cut(13,4))      =con(cut(13,1):cut(13,2),cut(13,3):cut(13,4))+ ar_data;
con(cut(14,1):cut(14,2),cut(14,3):cut(14,4))      =con(cut(14,1):cut(14,2),cut(14,3):cut(14,4))+ noest_data;
con(cut(15,1):cut(15,2),cut(15,3):cut(15,4))      =con(cut(15,1):cut(15,2),cut(15,3):cut(15,4))+ ce_data;
con(cut(16,1):cut(16,2),cut(16,3):cut(16,4))      =con(cut(16,1):cut(16,2),cut(16,3):cut(16,4))+ ou_data;
con(cut(17,1):cut(17,2),cut(17,3):cut(17,4))      =con(cut(17,1):cut(17,2),cut(17,3):cut(17,4))+ suest_data;
con(cut(18,1):cut(18,2),cut(18,3):cut(18,4))      =con(cut(18,1):cut(18,2),cut(18,3):cut(18,4))+ su_data;
con(cut(19,1):cut(19,2),cut(19,3):cut(19,4))      =con(cut(19,1):cut(19,2),cut(19,3):cut(19,4))+ ni_data;
con(cut(20,1):cut(20,2),cut(20,3):cut(20,4))      =con(cut(20,1):cut(20,2),cut(20,3):cut(20,4))+gr_data;

%Creat the Plot
   imagesc(con);

%Fontsize
a=10; %legende
b=6; %districts
c=6; %other countries
d=15; %title

%Update the Title
   text(1793,1400,sprintf('Infected Day %d in percent',l),'FontSize',d,'HorizontalAlignment','center');   
   text(869,-60,'Data','FontSize',12,'HorizontalAlignment','center')
   text(2715,-60,'Calculated','FontSize',12,'HorizontalAlignment','center')
   %Lable legend
   text(3760,139,sprintf('<%1.2e',legend(1)),'FontSize',a)
   text(3800,232,sprintf('%1.2e',legend(2)),'FontSize',a)
   text(3800,335,sprintf('%1.2e',legend(3)),'FontSize',a)
   text(3800,438,sprintf('%1.2e',legend(4)),'FontSize',a)
   text(3800,541,sprintf('%1.2e',legend(5)),'FontSize',a)
   text(3800,644,sprintf('%1.2e',legend(6)),'FontSize',a)
   text(3800,747,sprintf('%1.2e',legend(7)),'FontSize',a)
   text(3800,850,sprintf('%1.2e',legend(8)),'FontSize',a)
   text(3800,953,sprintf('%1.2e',legend(9)),'FontSize',a)
   text(3800,1056,sprintf('%1.2e',legend(10)),'FontSize',a)
   text(3760,1159,sprintf('>%1.2e',legend(11)),'FontSize',a)
   
 %lable districts
   text(133,295,'GRANDE-ANSE','FontSize',b)
   text(352,156,'SUD','FontSize',b)
   text(595,263,'NIPPES','FontSize',b)
   text(1201,162,'SUD-EST','FontSize',b)
   text(1300,296,'OUEST','FontSize',b)
   text(1410,654,'CENTRE','FontSize',b)
   text(1471,909,'NORD-','FontSize',b)
   text(1500,870,'EST','FontSize',b)
   text(1073,739,'ARTIBONITE','FontSize',b)
   text(1240,975,'NORD','FontSize',b)
   text(770,1074,'NORD-OUEST','FontSize',b) 
   
   text(1979,295,'GRANDE-ANSE','FontSize',b)
   text(2198,156,'SUD','FontSize',b)
   text(2441,263,'NIPPES','FontSize',b)
   text(3047,162,'SUD-EST','FontSize',b)
   text(3146,296,'OUEST','FontSize',b)
   text(3256,654,'CENTRE','FontSize',b)
   text(3317,909,'NORD-','FontSize',b)
   text(3346,870,'EST','FontSize',b)
   text(2919,739,'ARTIBONITE','FontSize',b)
   text(3086,975,'NORD','FontSize',b)
   text(2616,1074,'NORD-OUEST','FontSize',b)
   
   %lable other countries
   text(40,1270,'CUBA','FontSize',c)
   text(1710,740,'DOMINICAN REPUBLIC','Rotation',270,'FontSize',c)
   
   text(1886,1270,'CUBA','FontSize',c)
   text(3560,740,'DOMINICAN REPUBLIC','Rotation',270,'FontSize',c)
   
   
%Get the Frame
   frame = getframe(gcf);
   writeVideo(writerObj,frame);
end

close(writerObj)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Susceptible %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Prepare cal & data
new=[suspected_data(:);suspected_cal(:)];
e=quantile(new,[.05, 0.95]);
suspected_data(suspected_data > e(1,2))=e(1,2);
suspected_data(suspected_data < e(1,1))=e(1,1);
suspected_cal(suspected_cal > e(1,2))=e(1,2);
suspected_cal(suspected_cal < e(1,1))=e(1,1);

legend=linspace(e(1,1),e(1,2),11);
m=57/(e(1,2)-e(1,1));
q=62-(m*e(1,2));
cal=suspected_cal*m+q;
data=suspected_data*m+q;

% Video befehle 
scrsz = get(0,'ScreenSize');
myfig=figure('Position',[(scrsz(3)-1012)/2 (scrsz(4)-369)/2 1012 369]); 
figure(myfig);
set(gca,'NextPlot','replacechildren');

writerObj = VideoWriter('susceptible.avi','Uncompressed AVI');
writerObj.FrameRate = 6;
open(writerObj);

% Axis
axis off
axis equal
ylim([0 1400])
xlim([0 3846])

%Colormap
colormap(mycmap_suspected);

%Reclassify the map
for l=1:t;
   noq_cal=cal(6,l)*nordquest;     % nordquest
   no_cal=cal(5,l)*nord;           % nord
   ar_cal=cal(1,l)*artibonite;     % artibonite     
   noest_cal=cal(7,l)*nordest;     % nordest
   ce_cal=cal(2,l)*centre;         % centre   
   ou_cal=cal(8,l)*ouest;          % ouest     
   suest_cal=cal(10,l)*sudest;      % sudest 
   su_cal=cal(9,l)*sud;            % sud 
   ni_cal=cal(4,l)*nippes;         % nippes   
   gr_cal=cal(3,l)*grandanse;     % grandanse

   noq_data=data(6,l)*nordquest;     % nordquest
   no_data=data(5,l)*nord;           % nord
   ar_data=data(1,l)*artibonite;     % artibonite     
   noest_data=data(7,l)*nordest;     % nordest
   ce_data=data(2,l)*centre;         % centre   
   ou_data=data(8,l)*ouest;          % ouest     
   suest_data=data(10,l)*sudest;      % sudest 
   su_data=data(9,l)*sud;            % sud 
   ni_data=data(4,l)*nippes;         % nippes   
   gr_data=data(3,l)*grandanse;     % grandanse

%Place the Puzzle-Pieces
con = contur;
con(cut(1,1):cut(1,2),cut(1,3):cut(1,4))      =con(cut(1,1):cut(1,2),cut(1,3):cut(1,4))+ noq_cal;
con(cut(2,1):cut(2,2),cut(2,3):cut(2,4))      =con(cut(2,1):cut(2,2),cut(2,3):cut(2,4))+ no_cal;
con(cut(3,1):cut(3,2),cut(3,3):cut(3,4))      =con(cut(3,1):cut(3,2),cut(3,3):cut(3,4))+ ar_cal;
con(cut(4,1):cut(4,2),cut(4,3):cut(4,4))      =con(cut(4,1):cut(4,2),cut(4,3):cut(4,4))+ noest_cal;
con(cut(5,1):cut(5,2),cut(5,3):cut(5,4))      =con(cut(5,1):cut(5,2),cut(5,3):cut(5,4))+ ce_cal;
con(cut(6,1):cut(6,2),cut(6,3):cut(6,4))      =con(cut(6,1):cut(6,2),cut(6,3):cut(6,4))+ ou_cal;
con(cut(7,1):cut(7,2),cut(7,3):cut(7,4))      =con(cut(7,1):cut(7,2),cut(7,3):cut(7,4))+ suest_cal;
con(cut(8,1):cut(8,2),cut(8,3):cut(8,4))      =con(cut(8,1):cut(8,2),cut(8,3):cut(8,4))+ su_cal;
con(cut(9,1):cut(9,2),cut(9,3):cut(9,4))      =con(cut(9,1):cut(9,2),cut(9,3):cut(9,4))+ ni_cal;
con(cut(10,1):cut(10,2),cut(10,3):cut(10,4))  =con(cut(10,1):cut(10,2),cut(10,3):cut(10,4))+gr_cal;

con(cut(11,1):cut(11,2),cut(11,3):cut(11,4))      =con(cut(11,1):cut(11,2),cut(11,3):cut(11,4))+ noq_data;
con(cut(12,1):cut(12,2),cut(12,3):cut(12,4))      =con(cut(12,1):cut(12,2),cut(12,3):cut(12,4))+ no_data;
con(cut(13,1):cut(13,2),cut(13,3):cut(13,4))      =con(cut(13,1):cut(13,2),cut(13,3):cut(13,4))+ ar_data;
con(cut(14,1):cut(14,2),cut(14,3):cut(14,4))      =con(cut(14,1):cut(14,2),cut(14,3):cut(14,4))+ noest_data;
con(cut(15,1):cut(15,2),cut(15,3):cut(15,4))      =con(cut(15,1):cut(15,2),cut(15,3):cut(15,4))+ ce_data;
con(cut(16,1):cut(16,2),cut(16,3):cut(16,4))      =con(cut(16,1):cut(16,2),cut(16,3):cut(16,4))+ ou_data;
con(cut(17,1):cut(17,2),cut(17,3):cut(17,4))      =con(cut(17,1):cut(17,2),cut(17,3):cut(17,4))+ suest_data;
con(cut(18,1):cut(18,2),cut(18,3):cut(18,4))      =con(cut(18,1):cut(18,2),cut(18,3):cut(18,4))+ su_data;
con(cut(19,1):cut(19,2),cut(19,3):cut(19,4))      =con(cut(19,1):cut(19,2),cut(19,3):cut(19,4))+ ni_data;
con(cut(20,1):cut(20,2),cut(20,3):cut(20,4))      =con(cut(20,1):cut(20,2),cut(20,3):cut(20,4))+gr_data;

%Creat the Plot
   imagesc(con);

%Fontsize
a=10; %legende
b=6; %districts
c=6; %other countries
d=15; %title

%Update the Title
   text(1793,1400,sprintf('Susceptible Day %d in percent',l),'FontSize',d,'HorizontalAlignment','center');   
   text(869,-60,'Data','FontSize',12,'HorizontalAlignment','center')
   text(2715,-60,'Calculated','FontSize',12,'HorizontalAlignment','center')
   %Lable legend
   text(3760,139,sprintf('<%1.2e',legend(1)),'FontSize',a)
   text(3800,232,sprintf('%1.2e',legend(2)),'FontSize',a)
   text(3800,335,sprintf('%1.2e',legend(3)),'FontSize',a)
   text(3800,438,sprintf('%1.2e',legend(4)),'FontSize',a)
   text(3800,541,sprintf('%1.2e',legend(5)),'FontSize',a)
   text(3800,644,sprintf('%1.2e',legend(6)),'FontSize',a)
   text(3800,747,sprintf('%1.2e',legend(7)),'FontSize',a)
   text(3800,850,sprintf('%1.2e',legend(8)),'FontSize',a)
   text(3800,953,sprintf('%1.2e',legend(9)),'FontSize',a)
   text(3800,1056,sprintf('%1.2e',legend(10)),'FontSize',a)
   text(3760,1159,sprintf('>%1.2e',legend(11)),'FontSize',a)
   
 %lable districts
   text(133,295,'GRANDE-ANSE','FontSize',b)
   text(352,156,'SUD','FontSize',b)
   text(595,263,'NIPPES','FontSize',b)
   text(1201,162,'SUD-EST','FontSize',b)
   text(1300,296,'OUEST','FontSize',b)
   text(1410,654,'CENTRE','FontSize',b)
   text(1471,909,'NORD-','FontSize',b)
   text(1500,870,'EST','FontSize',b)
   text(1073,739,'ARTIBONITE','FontSize',b)
   text(1240,975,'NORD','FontSize',b)
   text(770,1074,'NORD-OUEST','FontSize',b) 
   
   text(1979,295,'GRANDE-ANSE','FontSize',b)
   text(2198,156,'SUD','FontSize',b)
   text(2441,263,'NIPPES','FontSize',b)
   text(3047,162,'SUD-EST','FontSize',b)
   text(3146,296,'OUEST','FontSize',b)
   text(3256,654,'CENTRE','FontSize',b)
   text(3317,909,'NORD-','FontSize',b)
   text(3346,870,'EST','FontSize',b)
   text(2919,739,'ARTIBONITE','FontSize',b)
   text(3086,975,'NORD','FontSize',b)
   text(2616,1074,'NORD-OUEST','FontSize',b)
   
   %lable other countries
   text(40,1270,'CUBA','FontSize',c)
   text(1710,740,'DOMINICAN REPUBLIC','Rotation',270,'FontSize',c)
   
   text(1886,1270,'CUBA','FontSize',c)
   text(3560,740,'DOMINICAN REPUBLIC','Rotation',270,'FontSize',c)   

   %Get the Frame
   frame = getframe(gcf);
   writeVideo(writerObj,frame);
end

close(writerObj)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Removed %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Prepare cal & data
new=[removed_data(:);removed_cal(:)];
e=quantile(new,[.05, 0.95]);
removed_data(removed_data > e(1,2))=e(1,2);
removed_data(removed_data < e(1,1))=e(1,1);
removed_cal(removed_cal > e(1,2))=e(1,2);
removed_cal(removed_cal < e(1,1))=e(1,1);

legend=linspace(e(1,1),e(1,2),11);
m=57/(e(1,2)-e(1,1));
q=62-(m*e(1,2));
cal=removed_cal*m+q;
data=removed_data*m+q;

% Video befehle 
scrsz = get(0,'ScreenSize');
myfig=figure('Position',[(scrsz(3)-1012)/2 (scrsz(4)-369)/2 1012 369]); 
figure(myfig);
set(gca,'NextPlot','replacechildren');

writerObj = VideoWriter('removed.avi','Uncompressed AVI');
writerObj.FrameRate = 6;
open(writerObj);

% Axis
axis off
axis equal
ylim([0 1400])
xlim([0 3846])

%Colormap
colormap(mycmap_removed);

%Reclassify the map
for l=1:t;
      noq_cal=cal(6,l)*nordquest;     % nordquest
   no_cal=cal(5,l)*nord;           % nord
   ar_cal=cal(1,l)*artibonite;     % artibonite     
   noest_cal=cal(7,l)*nordest;     % nordest
   ce_cal=cal(2,l)*centre;         % centre   
   ou_cal=cal(8,l)*ouest;          % ouest     
   suest_cal=cal(10,l)*sudest;      % sudest 
   su_cal=cal(9,l)*sud;            % sud 
   ni_cal=cal(4,l)*nippes;         % nippes   
   gr_cal=cal(3,l)*grandanse;     % grandanse

   noq_data=data(6,l)*nordquest;     % nordquest
   no_data=data(5,l)*nord;           % nord
   ar_data=data(1,l)*artibonite;     % artibonite     
   noest_data=data(7,l)*nordest;     % nordest
   ce_data=data(2,l)*centre;         % centre   
   ou_data=data(8,l)*ouest;          % ouest     
   suest_data=data(10,l)*sudest;      % sudest 
   su_data=data(9,l)*sud;            % sud 
   ni_data=data(4,l)*nippes;         % nippes   
   gr_data=data(3,l)*grandanse;     % grandanse

%Place the Puzzle-Pieces
con = contur;
con(cut(1,1):cut(1,2),cut(1,3):cut(1,4))      =con(cut(1,1):cut(1,2),cut(1,3):cut(1,4))+ noq_cal;
con(cut(2,1):cut(2,2),cut(2,3):cut(2,4))      =con(cut(2,1):cut(2,2),cut(2,3):cut(2,4))+ no_cal;
con(cut(3,1):cut(3,2),cut(3,3):cut(3,4))      =con(cut(3,1):cut(3,2),cut(3,3):cut(3,4))+ ar_cal;
con(cut(4,1):cut(4,2),cut(4,3):cut(4,4))      =con(cut(4,1):cut(4,2),cut(4,3):cut(4,4))+ noest_cal;
con(cut(5,1):cut(5,2),cut(5,3):cut(5,4))      =con(cut(5,1):cut(5,2),cut(5,3):cut(5,4))+ ce_cal;
con(cut(6,1):cut(6,2),cut(6,3):cut(6,4))      =con(cut(6,1):cut(6,2),cut(6,3):cut(6,4))+ ou_cal;
con(cut(7,1):cut(7,2),cut(7,3):cut(7,4))      =con(cut(7,1):cut(7,2),cut(7,3):cut(7,4))+ suest_cal;
con(cut(8,1):cut(8,2),cut(8,3):cut(8,4))      =con(cut(8,1):cut(8,2),cut(8,3):cut(8,4))+ su_cal;
con(cut(9,1):cut(9,2),cut(9,3):cut(9,4))      =con(cut(9,1):cut(9,2),cut(9,3):cut(9,4))+ ni_cal;
con(cut(10,1):cut(10,2),cut(10,3):cut(10,4))  =con(cut(10,1):cut(10,2),cut(10,3):cut(10,4))+gr_cal;

con(cut(11,1):cut(11,2),cut(11,3):cut(11,4))      =con(cut(11,1):cut(11,2),cut(11,3):cut(11,4))+ noq_data;
con(cut(12,1):cut(12,2),cut(12,3):cut(12,4))      =con(cut(12,1):cut(12,2),cut(12,3):cut(12,4))+ no_data;
con(cut(13,1):cut(13,2),cut(13,3):cut(13,4))      =con(cut(13,1):cut(13,2),cut(13,3):cut(13,4))+ ar_data;
con(cut(14,1):cut(14,2),cut(14,3):cut(14,4))      =con(cut(14,1):cut(14,2),cut(14,3):cut(14,4))+ noest_data;
con(cut(15,1):cut(15,2),cut(15,3):cut(15,4))      =con(cut(15,1):cut(15,2),cut(15,3):cut(15,4))+ ce_data;
con(cut(16,1):cut(16,2),cut(16,3):cut(16,4))      =con(cut(16,1):cut(16,2),cut(16,3):cut(16,4))+ ou_data;
con(cut(17,1):cut(17,2),cut(17,3):cut(17,4))      =con(cut(17,1):cut(17,2),cut(17,3):cut(17,4))+ suest_data;
con(cut(18,1):cut(18,2),cut(18,3):cut(18,4))      =con(cut(18,1):cut(18,2),cut(18,3):cut(18,4))+ su_data;
con(cut(19,1):cut(19,2),cut(19,3):cut(19,4))      =con(cut(19,1):cut(19,2),cut(19,3):cut(19,4))+ ni_data;
con(cut(20,1):cut(20,2),cut(20,3):cut(20,4))      =con(cut(20,1):cut(20,2),cut(20,3):cut(20,4))+gr_data;

%Creat the Plot
   imagesc(con);

%Fontsize
a=10; %legende
b=6; %districts
c=6; %other countries
d=15; %title

%Update the Title
   text(1793,1400,sprintf('Removed Day %d in percent',l),'FontSize',d,'HorizontalAlignment','center');   
   text(869,-60,'Data','FontSize',12,'HorizontalAlignment','center')
   text(2715,-60,'Calculated','FontSize',12,'HorizontalAlignment','center')
   %Lable legend
   text(3760,139,sprintf('<%1.2e',legend(1)),'FontSize',a)
   text(3800,232,sprintf('%1.2e',legend(2)),'FontSize',a)
   text(3800,335,sprintf('%1.2e',legend(3)),'FontSize',a)
   text(3800,438,sprintf('%1.2e',legend(4)),'FontSize',a)
   text(3800,541,sprintf('%1.2e',legend(5)),'FontSize',a)
   text(3800,644,sprintf('%1.2e',legend(6)),'FontSize',a)
   text(3800,747,sprintf('%1.2e',legend(7)),'FontSize',a)
   text(3800,850,sprintf('%1.2e',legend(8)),'FontSize',a)
   text(3800,953,sprintf('%1.2e',legend(9)),'FontSize',a)
   text(3800,1056,sprintf('%1.2e',legend(10)),'FontSize',a)
   text(3760,1159,sprintf('>%1.2e',legend(11)),'FontSize',a)
   
 %lable districts
   text(133,295,'GRANDE-ANSE','FontSize',b)
   text(352,156,'SUD','FontSize',b)
   text(595,263,'NIPPES','FontSize',b)
   text(1201,162,'SUD-EST','FontSize',b)
   text(1300,296,'OUEST','FontSize',b)
   text(1410,654,'CENTRE','FontSize',b)
   text(1471,909,'NORD-','FontSize',b)
   text(1500,870,'EST','FontSize',b)
   text(1073,739,'ARTIBONITE','FontSize',b)
   text(1240,975,'NORD','FontSize',b)
   text(770,1074,'NORD-OUEST','FontSize',b) 
   
   text(1979,295,'GRANDE-ANSE','FontSize',b)
   text(2198,156,'SUD','FontSize',b)
   text(2441,263,'NIPPES','FontSize',b)
   text(3047,162,'SUD-EST','FontSize',b)
   text(3146,296,'OUEST','FontSize',b)
   text(3256,654,'CENTRE','FontSize',b)
   text(3317,909,'NORD-','FontSize',b)
   text(3346,870,'EST','FontSize',b)
   text(2919,739,'ARTIBONITE','FontSize',b)
   text(3086,975,'NORD','FontSize',b)
   text(2616,1074,'NORD-OUEST','FontSize',b)
   
   %lable other countries
   text(40,1270,'CUBA','FontSize',c)
   text(1710,740,'DOMINICAN REPUBLIC','Rotation',270,'FontSize',c)
   
   text(1886,1270,'CUBA','FontSize',c)
   text(3560,740,'DOMINICAN REPUBLIC','Rotation',270,'FontSize',c)   

   %Get the Frame
   frame = getframe(gcf);
   writeVideo(writerObj,frame);
   
end
close(writerObj)
clear all

end
