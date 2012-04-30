%Daten   
data = rand(10,92);   
[d t] = size(data);
h_map_v = h_map_c;

% Video befehle 
figure(1)
numframes = t;
mov_i=moviein(t); % create the movie matrix
set(gca,'NextPlot','replacechildren');
axis equal; % fix the axes
colormap(mycmap);
for l=1:t;
 for i=1:a;
    for n=1:b;
   % nordquest
        if h_map_c(i,n)==1
            h_map_v(i,n)=data(1,l);
   % nord
        elseif h_map_c(i,n)==2
            h_map_v(i,n)=data(2,l);
   % artibonite         
        elseif h_map_c(i,n)==3
            h_map_v(i,n)=data(3,l);
   % nordest
        elseif h_map_c(i,n)==4
            h_map_v(i,n)=data(4,l);
   % centre         
        elseif h_map_c(i,n)==5
            h_map_v(i,n)=data(5,l);
   % ouest         
        elseif h_map_c(i,n)==6
            h_map_v(i,n)=data(6,l);
   % sudouest         
        elseif h_map_c(i,n)==7
            h_map_v(i,n)=data(7,l);
   % sud         
        elseif h_map_c(i,n)==8
            h_map_v(i,n)=data(8,l);
   % nippes         
        elseif h_map_c(i,n)==9
            h_map_v(i,n)=data(9,l);
   % grandanse         
        elseif h_map_c(i,n)== 10
            h_map_v(i,n)=data(10,l);
        end
    end
 end
 imagesc(h_map_v);
 mov_i(:,l)=getframe;
end
movie(mov_i,1,20); % Play the MATLAB movie
save movie.mat mov_i; % save the MATLAB movie to a file