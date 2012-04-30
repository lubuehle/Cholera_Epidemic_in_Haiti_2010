function [s,x, r,w]=euler(s,x,r,w, mu, lambda, gamma, epsilon);
%WATERQUAL Summary of this function goes here
%   Detailed explanation goes here
















%Calculations for the variable susceptible
ds=mu-mu.*s-lambda.*s;

s=s+ds;

if s>=1
    s=1;
end

if s<=0
    s=0;
end


%Calculations for the variable infectious
dx=-gamma.*x+lambda.*s-mu.*x;

x=x+dx;

if x>=1
    x=1;
end

if x<=0
    x=0;
end

%Calculations for the variable recovered


%dr=gamma.*r-mu.*r;

%r=r+dr;

r=1-s-x;

if r>=1
    r=1;
end

if r<=0
    r=0;
end



%Calculations for the variable waterquality


dw=epsilon.*(x-w);

w=w+dw;




end

