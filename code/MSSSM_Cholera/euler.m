function [s,x, r]=euler(s,x,r, lambda, gamma);
%this file is here to calculate the euler iteration

%Calculations for the variable susceptible
ds= -lambda.*s;

%Calculations for the variable infectious
dx= -gamma.*x + lambda.*s;

%Calculations for the variable recovered
dr= gamma.*x;

%Calculating f(t)=f(t-1)+df
s=s+ds;

x=x+dx;

r=r+dr;

end

