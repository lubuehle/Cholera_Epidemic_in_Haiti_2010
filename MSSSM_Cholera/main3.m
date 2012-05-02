%
%
%
%
%Load the data for comparison an phip plus phiw

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



d=10;
t=92;










%Changing of parameters for solver



%Sequence of 4

mutemplate=ones(1,64);

mutemplate(:,[1:16])=1;

mutemplate(:,[17:32])=0.5;

mutemplate(:,[33:48])=0.1;

mutemplate(:,[49:64])=0.01;





%Sequence of 2

betaxtemplate=ones(1,64);

betaxtemplate(:,[1:4:64])=1;

betaxtemplate(:,[5:8,21:24,37:40,53:56])=0.5;

betaxtemplate(:,[9:12, 25:28,41:44,57:60])=0.1;

betaxtemplate(:,[13:16,29:32,45:48,61:64])=0.01;





%Sequence of 1
gammatemplate=ones(1,64);

gammatemplate(:,[1:4:61])=1;

gammatemplate(:,[2:4:62])=0.5;

gammatemplate(:,[3:4:63])=0.1;

gammatemplate(:,[4:4:64])=0.01;





for k=1:64
        
        mu=mutemplate(:,k);
        gamma=gammatemplate(:,k);
        betax=betaxtemplate(:,k);
        
        
        [ gamma, mu, betax, minssq, smeanmod, xmeanmod, rmeanmod] = haiti_calc( mu, gamma, betax, susceptible_data, infectious_data, removed_data, phip );
        
        
        total_gamma(k)=gamma;
        total_mu(k)=mu;
        total_betax(k)=betax;
        
        total_ssq(k)=minssq;
        
        
        total_smean(k,:)=smeanmod;
        total_xmean(k,:)=xmeanmod;
        total_rmean(k,:)=rmeanmod;
        
        
        
        
        
end


[bestssq,bestid]=min(total_ssq)


gamma=total_gamma(bestid)
mu=total_mu(bestid)
betax=total_betax(bestid)



%Parameters for the differential equations


mu=ones(10,1)*mu;

gamma=ones(10,1)*gamma;

betax=ones(10,1)*betax;








%Prepare all the needed matrices

s=ones(d,t);

x=ones(d,t);

r=ones(d,t);



%put the corresponding data into the first colum
%-----------------------------------------------
%THIS IS THE INITIAL CONTIDIONS FOR THE MODEL




s(:,1)=susceptible_data(:,1);

x(:,1)=infectious_data(:,1);

r(:,1)=removed_data(:,1);








for p=2:t
    
    
    lambda = betax .* x(:,p-1) + phip * x(:,p-1);
    
    
    
    
    
   
    [s(:,p),x(:,p), r(:,p)]=euler(s(:,p-1),x(:,p-1),r(:,p-1), lambda, gamma, mu);
    
   
end















smeanmod_total=mean(total_smean);
xmeanmod_total=mean(total_xmean);
rmeanmod_total=mean(total_rmean);


smean=mean(susceptible_data);
xmean=mean(infectious_data);
rmean=mean(removed_data);

figure(1)
plot(total_smean(bestid,:))
hold on
plot(smean)

figure(2)
plot(total_xmean(bestid,:))
hold on
plot(xmean)

figure(3)
plot(total_rmean(bestid,:))
hold on
plot(rmean)



figure(4)
for o=1:10
    plot(s(o,:))
    hold on
end




figure(5)
for o=1:10
    plot(x(o,:))
    hold on
end





figure(6)
for o=1:10
    plot(r(o,:))
    hold on
end







