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
phip0 = fopen('Phip_data_semikolon.csv','r');
phip1 = fopen('Phip_data.csv','w');
fwrite(phip1,strrep(char(fread(phip0))',';',','));
fclose(phip0);
fclose(phip1);

phip = csvread('Phip_data.csv');





%Initialise all coefficients and parameters

%Amount of days calculated
t=92;

%Amount of districts Haiti is divided into
d=10;



%Parameters for the differential equations

mu=ones(10,1)*0.0278;

gamma=ones(10,1)*0.345;

epsilon=ones(10,1)*0.014;

betax=ones(10,1)*0.010;

betaw=ones(10,1)*0.944;

%Prepare all the needed matrices

s=ones(d,t);

x=ones(d,t);

r=ones(d,t);

w=ones(d,t);

%put the corresponding data into the first colum
%-----------------------------------------------
%THIS IS THE INITIAL CONTIDIONS FOR THE MODEL




s(:,1)=susceptible_data(:,1);

x(:,1)=infectious_data(:,1);

r(:,1)=removed_data(:,1);

w(:,1)=zeros(10,1);


%Set the phip and phiw (force of infection)
   
phiw= [1 1 1 1 1 1 1 1 1 1; 
       2 2 2 2 2 2 2 2 2 2; 
       3 3 3 3 3 3 3 3 3 3; 
       4 4 4 4 4 4 4 4 4 4; 
       5 5 5 5 5 5 5 5 5 5;
       6 6 6 6 6 6 6 6 6 6;
       7 7 7 7 7 7 7 7 7 7;
       8 8 8 8 8 8 8 8 8 8;
       9 9 9 9 9 9 9 9 9 9;
       10 10 10 10 10 10 10 10 10 10];







%Start the loop for time iteration calculation

for p=2:t
    
    
    lambda = betax .* x(:,p) + betaw .* w(:,p) + phip * x(:,p);
    
    
    
    
    
   
    [s(:,p),x(:,p), r(:,p),w(:,p)]=euler(s(:,p-1),x(:,p-1),r(:,p-1),w(:,p-1), mu, lambda, gamma, epsilon);
    
   
end



























%Initialisation of solver

ssqx=sum(sum((x-infectious_data).^2));

ssqr=sum(sum((r-removed_data).^2));

ssqs=sum(sum((s-susceptible_data).^2));

totalssq=ssqs+ssqr+ssqx;






while totalssq>=1

%Initialise all coefficients and parameters



%Changing of parameters for solver
%Sequence of 8

gammasolve=ones(10,16)*0.345;

gammasolve(:,[1:8])=gammasolve(:,[1:8])+gammasolve(:,[1:8]).*0.01;

gammasolve(:,[9:16])=gammasolve(:,[9:16])-gammasolve(:,[9:16]).*0.01;



%Sequence of 4

epsilonsolve=ones(10,16)*0.014;

epsilonsolve(:,[1:4, 9:12])=epsilonsolve(:,[1:4, 9:12])+epsilonsolve(:,[1:4, 9:12]).*0.01;

epsilonsolve(:,[5:8,13:16])=epsilonsolve(:,[5:8,13:16])-epsilonsolve(:,[5:8,13:16]).*0.01;





%Sequence of 2

betaxsolve=ones(10,16)*0.010;

betaxsolve(:,[1,2,5,6,9,10,13,14])=betaxsolve(:,[1,2,5,6,9,10,13,14])+betaxsolve(:,[1,2,5,6,9,10,13,14]).*0.01;

betaxsolve(:,[3,4,7,8,11,12,15,16])=betaxsolve(:,[3,4,7,8,11,12,15,16])-betaxsolve(:,[3,4,7,8,11,12,15,16]).*0.01;






%Sequence of 1
betawsolve=ones(10,16)*0.944;

betawsolve(:,[1:2:15])=betawsolve(:,[1:2:15])+betawsolve(:,[1:2:15]).*0.01;

betawsolve(:,[2:2:16])=betawsolve(:,[2:2:16])-betawsolve(:,[2:2:16]).*0.01;





%Prepare all the needed matrices

s=ones(d,t);

x=ones(d,t);

r=ones(d,t);

w=ones(d,t);




%put the corresponding data into the first colum
%-----------------------------------------------
%THIS IS THE INITIAL CONTIDIONS FOR THE MODEL




s(:,1)=susceptible_data(:,1);

x(:,1)=infectious_data(:,1);

r(:,1)=removed_data(:,1);

w(:,1)=zeros(10,1);




ssqsolver=ones(1,16)*10000;

    for z=1:16
        
        gammasolveloop=gammasolve(:,z);
        epsilonsolveloop=epsilonsolve(:,z);
        betaxsolveloop=betaxsolve(:,z);
        betawsolveloop=betawsolve(:,z);



        %Start the loop for time iteration calculation

        for p=2:t
    
    
            lambdasolveloop = betaxsolveloop .* x(:,p) + betawsolveloop .* w(:,p) + phip * x(:,p);
    
    
    
    
    
   
            [s(:,p),x(:,p), r(:,p),w(:,p)]=eulersolve(s(:,p-1),x(:,p-1),r(:,p-1),w(:,p-1), mu, lambdasolveloop, gammasolveloop, epsilonsolveloop);
    
            
        end
        
        
        
        ssqxsolve=sum(sum((x-infectious_data).^2));

        ssqrsolve=sum(sum((r-removed_data).^2));
        

        ssqssolve=sum(sum((s-susceptible_data).^2));

        totalssqsolve=ssqssolve+ssqrsolve+ssqxsolve;
        
        ssqsolver(z)=totalssqsolve;
        
        
        
        
    end
    [C,I]=min(ssqsolver);
    
    gamma=gammasolve(:,I);
      
    epsilon=epsilonsolve(:,I);

    betax=epsilonsolve(:,I);

    betaw=epsilonsolve(:,I);

    
    totalssq=ssqsolver(I)
    
    
    
    
end








smeanmod=mean(s);
xmeanmod=mean(x);
rmeanmod=mean(r);


smean=mean(susceptible_data);
xmean=mean(infectious_data);
rmean=mean(removed_data);


figure(1)
plot(smeanmod)
title('Susceptible')



figure(2)
plot(rmeanmod)
title('Removed')



figure(3)
plot(xmeanmod)
title('Infectious')





%Plot of mean daisy area versus time
figure(4)
subplot(1,1,1)
%plot(smeanmod,'k-', 'LineWidth', 1)
%hold on;
plot(xmeanmod, 'g-', 'LineWidth', 1)
hold on;
plot(rmeanmod, 'r:', 'LineWidth', 1)
hold on;
xlabel('Time')
ylabel('Mean planetary daisy area')
legend('Susceptible', 'Infectious', 'Removed', 2)
title('Calculations of model')

