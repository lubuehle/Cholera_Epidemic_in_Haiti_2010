function [s,x, r]=eulersolve(s,x,r, lambdasolveloop, gammasolveloop, musolveloop);
%WATERQUAL Summary of this function goes here
%   Detailed explanation goes here
















%Calculations for the variable susceptible
ds=musolveloop-lambdasolveloop.*s-musolveloop.*s;

s=s+ds;



%Calculations for the variable infectious
dx=-gammasolveloop.*x+lambdasolveloop.*s-musolveloop.*x;

x=x+dx;

%Calculations for the variable recovered


dr=gammasolveloop.*x-musolveloop.*r;

r=r+dr;

%r=1-s-x;








end

