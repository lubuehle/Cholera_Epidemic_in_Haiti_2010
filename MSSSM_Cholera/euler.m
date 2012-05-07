function [s,x, r]=euler(s,x,r, lambda, gamma, mu);
%WATERQUAL Summary of this function goes here
%   Detailed explanation goes here











%Calculations for the variable susceptible
ds=mu-mu.*s-lambda.*s;

%Calculations for the variable infectious
dx=-gamma.*x+lambda.*s-mu.*x;

%Calculations for the variable recovered

dr=gamma.*x-mu.*r;

%Calculations for the variable waterquality

dw=epsilon.*(x-w);


%Updating the concentrations of each variable

s=s+ds;

x=x+dx;

r=r+dr;

%r=1-s-x;

w=w+dw;




end

