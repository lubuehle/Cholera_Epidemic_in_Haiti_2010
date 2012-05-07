function [s,x, r,w]=eulersolve(s,x,r,w, mu, lambdasolveloop, gammasolveloop, epsilonsolveloop);
%WATERQUAL Summary of this function goes here
%   Detailed explanation goes here
















%Calculations for the variable susceptible
ds=mu-mu.*s-lambdasolveloop.*s;

s=s+ds;



%Calculations for the variable infectious
dx=-gammasolveloop.*x+lambdasolveloop.*s-mu.*x;

x=x+dx;

%Calculations for the variable recovered


dr=gammasolveloop.*x-mu.*r;

r=r+dr;

%r=1-s-x;



%Calculations for the variable waterquality


dw=epsilonsolveloop.*(x-w);

w=w+dw;




end

