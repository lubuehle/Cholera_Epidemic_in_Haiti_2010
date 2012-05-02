
%Initialise all coefficients and parameters

%Amount of days calculated
t=1000;

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
    
    
    lambda = betax .* x(:,p-1) + betaw .* w(:,p-1) + phip * x(:,p-1);
    
    
    
    
    
   
    [s(:,p),x(:,p), r(:,p),w(:,p)]=euler(s(:,p-1),x(:,p-1),r(:,p-1),w(:,p-1), mu, lambda, gamma, epsilon);
    
   
end

smeanmod=mean(s);
xmeanmod=mean(x);
rmeanmod=mean(r);


smean=mean(susceptible_data);
xmean=mean(infectious_data);
rmean=mean(removed_data);





%Plot of mean daisy area versus time
figure(1)
subplot(1,1,1)
plot(smeanmod,'k-', 'LineWidth', 2)
hold on;
plot(xmeanmod, 'g-', 'LineWidth', 2)
hold on;
plot(rmeanmod, 'r:', 'LineWidth', 2)
hold on;
xlabel('Time')
ylabel('Mean planetary daisy area')
legend('Susceptible', 'Infectious', 'Removed', 2)
title('Calculations of model')

figure(2)
for o=1:10
    plot(x(o,:))
    hold on;
end
