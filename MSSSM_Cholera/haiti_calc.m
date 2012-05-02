function [ gamma, mu, betax, minssq, smeanmod, xmeanmod, rmeanmod] = haiti_calc( mu, gamma, betax, susceptible_data, infectious_data, removed_data, phip )





%HAITI_CALC Summary of this function goes here
%   Detailed explanation goes here











%Initialise all coefficients and parameters

%Amount of days calculated
t=92;

%Amount of districts Haiti is divided into
d=10;

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







%Start the loop for time iteration calculation

for p=2:t
    
    
    lambda = betax .* x(:,p-1) + phip * x(:,p-1);
    
    
    
    
    
   
    [s(:,p),x(:,p), r(:,p)]=euler(s(:,p-1),x(:,p-1),r(:,p-1), lambda, gamma, mu);
    
   
end























%Initialisation of solver

ssqx=sum(sum((x-infectious_data).^2));

ssqr=sum(sum((r-removed_data).^2));

ssqs=sum(sum((s-susceptible_data).^2));

totalssq=ssqs+ssqr+ssqx;














coefficients=ones(3,500);
solvercount=2;

ssqvector(solvercount-1)=totalssq+1;
ssqvector(solvercount)=totalssq;







while abs(ssqvector(solvercount-1)-ssqvector(solvercount))  >=  0.000001*ssqvector(solvercount-1)
    
    
%Initialise all coefficients and parameters





%Changing of parameters for solver



%Sequence of 4

musolve=ones(10,8)*mu(1,1);

musolve(:,[1:4])=musolve(:,[1:4])+musolve(:,[1:4]).*0.01;

musolve(:,[5:8])=musolve(:,[5:8])-musolve(:,[5:8]).*0.01;





%Sequence of 2

betaxsolve=ones(10,8)*betax(1,1);

betaxsolve(:,[1,2,5,6])=betaxsolve(:,[1,2,5,6])+betaxsolve(:,[1,2,5,6]).*0.01;

betaxsolve(:,[3,4,7,8])=betaxsolve(:,[3,4,7,8])-betaxsolve(:,[3,4,7,8]).*0.01;





%Sequence of 1
gammasolve=ones(10,8)*gamma(1,1);

gammasolve(:,[1:2:7])=gammasolve(:,[1:2:7])+gammasolve(:,[1:2:7]).*0.01;

gammasolve(:,[2:2:8])=gammasolve(:,[2:2:8])-gammasolve(:,[2:2:8]).*0.01;



















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






ssqsolver=ones(1,8)*1000;

    for z=1:8
        
        gammasolveloop=gammasolve(:,z);
        musolveloop=musolve(:,z);
        betaxsolveloop=betaxsolve(:,z);
        



        %Start the loop for time iteration calculation

        for p=2:t
    
    
            lambdasolveloop = betaxsolveloop .* x(:,p-1)  + phip * x(:,p-1);
    
    
    
    
    
   
            [s(:,p),x(:,p), r(:,p)]=eulersolve(s(:,p-1),x(:,p-1),r(:,p-1), lambdasolveloop, gammasolveloop, musolveloop);
    
            
        end
        
        
        
        ssqxsolve=sum(sum((x-infectious_data).^2));

        ssqrsolve=sum(sum((r-removed_data).^2));
        
        ssqssolve=sum(sum((s-susceptible_data).^2));

        
        
        totalssqsolve=ssqssolve+ssqrsolve+ssqxsolve;
        
        ssqsolver(z)=totalssqsolve;
        
        
        
        
    end
    
    
    
    
    
    [C,I]=min(ssqsolver);
    
    gamma=gammasolve(:,I);
      
    mu=musolve(:,I);

    betax=betaxsolve(:,I);

    

    
    totalssq=ssqsolver(I);
    
    
    coefficients(1,solvercount)=gamma(1,1);
    coefficients(2,solvercount)=mu(1,1);
    coefficients(3,solvercount)=betax(1,1);
    
    
    solvercount=solvercount+1;
    
    
    ssqvector(solvercount)=totalssq;
    
    
    
    
    if solvercount>=500
            break
    end
    
    
    
    
    
end







%Recalculate with the best fit parameters

[minssq,vectorpoint]=min(ssqvector);

gamma=coefficients(1,vectorpoint);
mu=coefficients(2,vectorpoint);
betax=coefficients(3,vectorpoint);




for p=2:t
    
    
    lambda = betax .* x(:,p-1) + phip * x(:,p-1);
    
    
    
    
    
   
    [s(:,p),x(:,p), r(:,p)]=euler(s(:,p-1),x(:,p-1),r(:,p-1), lambda, gamma, mu);
    
   
end

smeanmod=mean(s);
xmeanmod=mean(x);
rmeanmod=mean(r);


















end

