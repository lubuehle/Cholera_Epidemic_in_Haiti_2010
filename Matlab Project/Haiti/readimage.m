h_map = imread('haiti.png');

[a b c] = size(h_map);

for i=1:a
    for n=1:b
   % nordquest
        if h_map(i,n,1)==204
            h_map_c(i,n,1)=1;
   % nord
        elseif h_map(i,n,1)==102
            h_map_c(i,n,1)=2;
   % artibonite         
        elseif h_map(i,n,2)==38
            h_map_c(i,n,1)=3;
   % nordest
        elseif h_map(i,n,2)==102
            h_map_c(i,n,1)=4;
   % centre         
        elseif h_map(i,n,2)==216&& h_map(i,n,1)==255
            h_map_c(i,n,1)=5;
   % ouest         
        elseif h_map(i,n,2)==22
            h_map_c(i,n,1)=6;
   % sudouest         
        elseif h_map(i,n,3)==255 && h_map(i,n,2)==255
            h_map_c(i,n,1)=7;
   % sud         
        elseif h_map(i,n,1)==255 && h_map(i,n,3)==0
            h_map_c(i,n,1)=8;
   % nippes         
        elseif h_map(i,n,1)==0 && h_map(i,n,3)==255
            h_map_c(i,n,1)=9;
   % grandanse         
        elseif h_map(i,n,1)==0 && h_map(i,n,2)==255
            h_map_c(i,n,1)=10;
   % ocean         
        elseif h_map(i,n,1)==216
            h_map_c(i,n,1)=-(3/60);
   % conture
           elseif h_map(i,n,1)==0 && h_map(i,n,2)==0 && h_map(i,n,3)==0
            h_map_c(i,n,1)=-(1/60);
   % land
        else h_map_c(i,n,1)=-(2/60);
   
        end
    end
end