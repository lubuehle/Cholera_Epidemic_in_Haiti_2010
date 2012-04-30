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
susceptible0 = fopen('Susceptible_data_semikolon.csv','r');
susceptible1 = fopen('Susceptible_data.csv','w');
fwrite(susceptible1,strrep(char(fread(susceptible0))',';',','));
fclose(susceptible0);
fclose(susceptible1);

susceptible_data = csvread('Susceptible_data.csv');

plot(infectious_data(3,:))



% Loading the PHIp values
phip0 = fopen('Phip_data_semikolon.csv','r');
phip1 = fopen('Phip_data.csv','w');
fwrite(phip1,strrep(char(fread(phip0))',';',','));
fclose(phip0);
fclose(phip1);

phip = csvread('Phip_data.csv');


