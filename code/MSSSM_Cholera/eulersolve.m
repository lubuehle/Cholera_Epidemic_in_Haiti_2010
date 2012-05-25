function [s,x, r]=eulersolve(s,x,r, lambdasolveloop, gammasolveloop);
%This file calculates the euler iteration for the solver.


%Calculations for the variable susceptible
ds=-lambdasolveloop.*s;


%Calculations for the variable infectious
dx=-gammasolveloop.*x + lambdasolveloop.*s;


%Calculations for the variable recovered
dr=gammasolveloop.*x;


%Calculating f(t)=f(t-1)+df
x=x+dx;

s=s+ds;

r=r+dr;




end

