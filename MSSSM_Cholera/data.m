% This file is used to store all the data in the corresponding metrices to make comparison


% Loading the Infectious data
infect0 = fopen('Infectious_data_semikolon.csv','r');
infect1 = fopen('Infectious_data.csv','w');
fwrite(infect1,strrep(char(fread(infect0))',';',','));
fclose(infect0);
fclose(infect1);

infectious_data = csvread('Infectious_data.csv');



% Loading the removed data
removed0 = fopen('Removed_data_semikolon.csv','r');
removed1 = fopen('Removed_data.csv','w');
fwrite(removed1,strrep(char(fread(removed0))',';',','));
fclose(removed0);
fclose(removed1);

removed_data = csvread('Removed_data.csv');




% Loading the visible data
visible0 = fopen('Visible_data_semikolon.csv','r');
visible1 = fopen('Visible_data.csv','w');
fwrite(visible1,strrep(char(fread(visible0))',';',','));
fclose(visible0);
fclose(visible1);

visible_data = csvread('Visible_data.csv');
