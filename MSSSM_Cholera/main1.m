%
%
%
%
%

%Initialise all coefficients and parameters

%Amount of days calculated
t=31;

%Amount of districts Haiti is divided into
d=10;



%Parameters for the differential equations

mu=ones(10,1)*2.8;

lambda=ones(10,1)*0.4;

gamma=ones(10,1)*0.3;

epsilon=ones(10,1)*0.6;

betax=ones(10,1)*0.01;

betaw=ones(10,1)*0.94;

%Prepare all the needed matrices

s=ones(d,t);

x=ones(d,t);

r=ones(d,t);

w=ones(d,t);

%put the corresponding data into the first colum
%-----------------------------------------------
%THIS IS THE INITIAL CONTIDIONS FOR THE MODEL




s(:,1)=ones(10,1)*random('norm',0,1);

x(:,1)=ones(10,1)*random('norm',0,1);

r(:,1)=ones(10,1)*random('norm',0,1);

w(:,1)=ones(10,1)*random('norm',0,1);


%Set the phip and phiw (force of infection)

phip= [1 1 1 1 1 1 1 1 1 1; 
       2 2 2 2 2 2 2 2 2 2; 
       3 3 3 3 3 3 3 3 3 3; 
       4 4 4 4 4 4 4 4 4 4; 
       5 5 5 5 5 5 5 5 5 5;
       6 6 6 6 6 6 6 6 6 6;
       7 7 7 7 7 7 7 7 7 7;
       8 8 8 8 8 8 8 8 8 8;
       9 9 9 9 9 9 9 9 9 9;
       10 10 10 10 10 10 10 10 10 10];
   
   
   
   
   
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

phip * x(:,2)





%Start the loop for time iteration calculation

for p=2:t
    
    
    lambda = betax .* x(:,p) + betaw .* w(:,p) + phip * x(:,p) + phiw * x(:,p);
    
    
    
    
    
   
    [s(:,p),x(:,p), r(:,p),w(:,p)]=euler(s(:,p-1),x(:,p-1),r(:,p-1),w(:,p-1), mu, lambda, gamma, epsilon);
    
   
end




s








