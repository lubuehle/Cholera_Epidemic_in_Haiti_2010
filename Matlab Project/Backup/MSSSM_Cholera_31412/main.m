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

mu=2.8;

lambda=0.4;

gamma=0.3;

epsilon=0.6;



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





%Start the loop for time iteration calculation

for p=2:t
    
    
    
    
    
    
    
   
    [s(:,p),x(:,p), r(:,p),w(:,p)]=euler(s(:,p-1),x(:,p-1),r(:,p-1),w(:,p-1), mu, lambda, gamma, epsilon);
    
   
end













