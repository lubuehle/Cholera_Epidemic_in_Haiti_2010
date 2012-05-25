%HAITI CHOLERA EPIDEMIC 2010
%
%This model is built up with four main files. 
%The initialisation file starts the model, loads the data and plots the
%final results.
%
%The haiti_calc file calculates the matrices and holds the solver
%
%The euler files hold the differential equations and calculate timestep t+1
%by the euler approximation
%
%For better understanding of the variables please read the model report.
clear all



%Load the observed data, change semikolon to colon and store as matrices 


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




% Loading the PHIp values
phip0 = fopen('phip_semikolon.csv','r');
phip1 = fopen('Phip_data.csv','w');
fwrite(phip1,strrep(char(fread(phip0))',';',','));
fclose(phip0);
fclose(phip1);

phip = csvread('Phip_data.csv');




%Set the variables for the amount of calculated days t and districts d
d=10;
t=92;




%These are different values within the proposed interval for betax and
%gamma

var1=4.5;

var2=4;

var3=3.5;

var4=3;



%Creating all 64 possible scenarios with the four different initial values.
%Sequence of 16 means 16 times first value, then 16 times second etc. In
%the end we have three vectors of length 64 with a specific pattern of
%values


%Sequence of 16 for kappa

kappatemplate=ones(1,64);

kappatemplate(:,[1:16])=8*10^-11;

kappatemplate(:,[17:32])=5*10^-11;

kappatemplate(:,[33:48])=3*10^-11;

kappatemplate(:,[49:64])=1.5*10^-11;


%Sequence of 4 for betax

betaxtemplate=ones(1,16);

betaxtemplate(:,[1:4])=var1;

betaxtemplate(:,[5:8])=var2;

betaxtemplate(:,[9:12])=var3;

betaxtemplate(:,[13:16])=var4;

betaxtemplate=repmat(betaxtemplate,1,4);


%Sequence of 2 for gamma

gammatemplate=ones(1,16);

gammatemplate(:,[1:4:13])=var1;

gammatemplate(:,[2:4:14])=var2;

gammatemplate(:,[3:4:15])=var3;

gammatemplate(:,[4:4:16])=var4;

gammatemplate=repmat(gammatemplate,1,4);





%Handing the values over to the haiti_calc function. The function returns
%the calculatet matrices for s, x and r plus the fittet coefficients with
%the corresponding SSQ.

for k=1:64
        
        kappa=kappatemplate(k);
        gamma=gammatemplate(k);
        betax=betaxtemplate(k);
        
        
        [ gamma, betax, kappa, minssq, smeanmod, xmeanmod, rmeanmod] = haiti_calc(gamma, betax, kappa, phip, susceptible_data, infectious_data, removed_data);
        
        total_kappa(k)=kappa;
        
        total_gamma(k)=gamma;
       
        total_betax(k)=betax;
        
        total_ssq(k)=minssq
        
        
        total_smean(k,:)=smeanmod;
        total_xmean(k,:)=xmeanmod;
        total_rmean(k,:)=rmeanmod;
        
        
        
        
        
        
end


%Extracting the best fit from the SSQ vector and setting the coefficients
%to the corresponding values
[bestssq,bestid]=min(total_ssq)

kappa=total_kappa(bestid)

gamma=total_gamma(bestid)

betax=total_betax(bestid)



%Setting the parameters for the differential equations to the right format
gamma=ones(10,1)*gamma;

betax=ones(10,1)*betax;

kappa=kappa;






%Prepare the needed blank matrices
s=ones(d,t);

x=ones(d,t);

r=ones(d,t);



%-----------------------------------------------
%THESE ARE THE INITIAL CONTIDIONS FOR THE MODEL
%Setting the district Grand Anse to the same as Nord Ouest
s(:,1)=susceptible_data(:,1);

x(:,1)=infectious_data(:,1);

r(:,1)=removed_data(:,1);

x(3,1)=infectious_data(6,1);




%Recalculating the model with the final coefficients
for p=2:t
    
    
    lambda = betax .* x(:,p-1) + (kappa*phip)*x(:,p-1);
    
    
    
    
    
   
    [s(:,p),x(:,p), r(:,p)]=euler(s(:,p-1),x(:,p-1),r(:,p-1), lambda, gamma);
    
   
end




%Calculating the means for plotting of the observed and calculated data
smeanmod_total=mean(s);
xmeanmod_total=mean(x);
rmeanmod_total=mean(r);


smean=mean(susceptible_data);
xmean=mean(infectious_data);
rmean=mean(removed_data);





%Plotting the means of susceptible data
figure(1)
plot(smeanmod_total, 'r-')
hold on
plot(smean, 'b-.')
title('Susceptible overall mean');
xlabel('Time')
ylabel('Percentage of population')
legend('Model calculations', 'Observed Data','Location','SouthWest')

%Plotting the means of the infectious data
figure(2)
plot(xmeanmod_total, 'r-')
hold on
plot(xmean, 'b-.')
title('Infectious');
xlabel('Time')
ylabel('Percentage of population')
legend('Model calculations', 'Observed Data','Location','NorthEast')

%Plotting the means of the removed data
figure(3)
plot(rmeanmod_total, 'r-')
hold on
plot(rmean, 'b-.')
title('Removed');
xlabel('Time')
ylabel('Percentage of population')
legend('Model calculations', 'Observed Data','Location','NorthWest')


%Preparing the colors for the plots with all ten districts displayed
mod_cols=[  1   0   0
            0   1   0
            0   0   1
            1   1   0
            0   1   1
            1   0   1
            0.5 0   0
            0   0.5 0
            0   0   0.5
            0   0   0
                        ];




%Plotting all ten districts of the infectious data
figure(4)
for o=1:10
    plot(x(o,:),'Color',mod_cols(o,:),'LineStyle','-')
    hold on
end
for o=1:10
    plot(infectious_data(o,:),'Color',mod_cols(o,:),'LineStyle','-.')
    hold on
end
xlabel('Time')
ylabel('Percentage of population')
legend('Artibonite', 'Centre', 'Grand Anse', 'Nippes','Nord', 'Nord Ouest','Nord Est','Ouest','Sud','Sud Est')
title('Observations of infectious by department')

%Plotting all ten districts for the susceptible data
figure(5)
for o=1:10
    plot(s(o,:),'Color',mod_cols(o,:),'LineStyle','-')
    hold on
end
for o=1:10
    plot(susceptible_data(o,:),'Color',mod_cols(o,:),'LineStyle','-.')
    hold on
end
xlabel('Time')
ylabel('Percentage of population')
legend('Artibonite', 'Centre', 'Grand Anse', 'Nippes','Nord', 'Nord Ouest','Nord Est','Ouest','Sud','Sud Est','Location','SouthWest')
title('Observations of susceptible by department')

%Plotting all ten districts for the removed data
figure(6)
for o=1:10
    plot(r(o,:),'Color',mod_cols(o,:),'LineStyle','-')
    hold on
end
for o=1:10
    plot(removed_data(o,:),'Color',mod_cols(o,:),'LineStyle','-.')
    hold on
end

xlabel('Time')
ylabel('Percentage of population')
legend('Artibonite', 'Centre', 'Grand Anse', 'Nippes','Nord', 'Nord Ouest','Nord Est','Ouest','Sud','Sud Est','Location','NorthWest')
title('Observations of removed by department')
