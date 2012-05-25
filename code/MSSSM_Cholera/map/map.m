%Read the image
h_map = imread('haiti.bmp');

%Definition the valus for the Loop
[a b]= size(h_map);

% Creat the District-Matrix_cal
nordquest_cal=zeros(a,b);
nord_cal=zeros(a,b);
artibonite_cal=zeros(a,b);
nordest_cal=zeros(a,b);
centre_cal=zeros(a,b);
nippes_cal=zeros(a,b);
grandanse_cal=zeros(a,b);
ouest_cal=zeros(a,b);
sud_cal=zeros(a,b);
sudest_cal=zeros(a,b);
contur_cal=zeros(a,b);

% Creat the District-Matrix_data
nordquest_data=zeros(a,b);
nord_data=zeros(a,b);
artibonite_data=zeros(a,b);
nordest_data=zeros(a,b);
centre_data=zeros(a,b);
nippes_data=zeros(a,b);
grandanse_data=zeros(a,b);
ouest_data=zeros(a,b);
sud_data=zeros(a,b);
sudest_data=zeros(a,b);
contur_data=zeros(a,b);

%Definition of the District-Matrixs and the Contur-Matrix
for i=1:a
    for n=1:b
%Calc_map
        if h_map(i,n)==   14     % nordquest
            nordquest_cal(i,n)=1;
        elseif h_map(i,n)== 16   % nord
            nord_cal(i,n)=1;
        elseif h_map(i,n)== 15   % artibonite  
            artibonite_cal(i,n)=1;
        elseif h_map(i,n)==  17  % nordest
            nordest_cal(i,n)=1;
        elseif h_map(i,n)==   18 % centre         
           centre_cal(i,n)=1;     
        elseif h_map(i,n)==   22% ouest
           ouest_cal(i,n)=1;
        elseif h_map(i,n)==23   % sudest 
            sudest_cal(i,n)=1;
        elseif h_map(i,n)==26   % sud  
           sud_cal(i,n)=1;
        elseif h_map(i,n)==24   % nippes  
            nippes_cal(i,n)=1;
        elseif h_map(i,n)==25   % grandanse
            grandanse_cal(i,n)=1;
            
%contur
        elseif h_map(i,n)==21   % ocean
            contur(i,n)=1;
        elseif h_map(i,n)==11   % line
            contur(i,n)=2;
        elseif h_map(i,n)==27   % land
            contur(i,n)=3;
        elseif h_map(i,n)==0    % text&line
            contur(i,n)=63;
        elseif h_map(i,n)==28   % background
            contur(i,n)=4;
        elseif h_map(i,n)==12    % colorbar
            contur(i,n)=(57/1014)*(i-143)+5;
% data      
        elseif h_map(i,n)==10    % nordquest
            nordquest_data(i,n)=1;
        elseif h_map(i,n)==9    % nord
            nord_data(i,n)=1;
        elseif h_map(i,n)==7    % artibonite  
            artibonite_data(i,n)=1;
        elseif h_map(i,n)==8    % nordest
            nordest_data(i,n)=1;
        elseif h_map(i,n)==6   % centre         
           centre_data(i,n)=1;     
        elseif h_map(i,n)==5   % ouest
           ouest_data(i,n)=1;
        elseif h_map(i,n)==4   % sudest 
            sudest_data(i,n)=1;
        elseif h_map(i,n)== 1  % sud  
           sud_data(i,n)=1;
        elseif h_map(i,n)== 3  % nippes  
            nippes_data(i,n)=1;
        elseif h_map(i,n)==2   % grandanse
            grandanse_data(i,n)=1;
        end
    end
end


%Identify the puzzle piece
cut=zeros(20,4);

[m,n] = find(nordquest_cal);
cut(1,1:4)  = [min(m),max(m),min(n),max(n)];    
[m,n] = find(nord_cal);
cut(2,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(artibonite_cal);
cut(3,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(nordest_cal);
cut(4,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(centre_cal);
cut(5,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(ouest_cal);
cut(6,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(sudest_cal);
cut(7,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(sud_cal);
cut(8,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(nippes_cal);
cut(9,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(grandanse_cal);
cut(10,1:4) = [min(m),max(m),min(n),max(n)];

[m,n] = find(nordquest_data);
cut(11,1:4)  = [min(m),max(m),min(n),max(n)];    
[m,n] = find(nord_data);
cut(12,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(artibonite_data);
cut(13,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(nordest_data);
cut(14,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(centre_data);
cut(15,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(ouest_data);
cut(16,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(sudest_data);
cut(17,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(sud_data);
cut(18,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(nippes_data);
cut(19,1:4)  = [min(m),max(m),min(n),max(n)];
[m,n] = find(grandanse_data);
cut(20,1:4) = [min(m),max(m),min(n),max(n)];

%Cut the puzzle pieces
nordquest   = nordquest_cal(cut(1,1):cut(1,2),cut(1,3):cut(1,4));   
nord        = nord_cal(cut(2,1):cut(2,2),cut(2,3):cut(2,4)); 
artibonite  = artibonite_cal(cut(3,1):cut(3,2),cut(3,3):cut(3,4)); 
nordest     = nordest_cal(cut(4,1):cut(4,2),cut(4,3):cut(4,4)); 
centre      = centre_cal(cut(5,1):cut(5,2),cut(5,3):cut(5,4)); 
ouest       = ouest_cal(cut(6,1):cut(6,2),cut(6,3):cut(6,4)); 
sudest      = sudest_cal(cut(7,1):cut(7,2),cut(7,3):cut(7,4)); 
sud         = sud_cal(cut(8,1):cut(8,2),cut(8,3):cut(8,4)); 
nippes      = nippes_cal(cut(9,1):cut(9,2),cut(9,3):cut(9,4)); 
grandanse   = grandanse_cal(cut(10,1):cut(10,2),cut(10,3):cut(10,4)); 

%save the datas
save map.mat sudest sud ouest nordquest nordest nord nippes grandanse centre artibonite
save contur.mat contur
save cut.mat cut

clear all