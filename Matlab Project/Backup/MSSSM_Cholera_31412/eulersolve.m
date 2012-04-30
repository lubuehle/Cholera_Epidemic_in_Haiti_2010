function [s,x, r,w]=eulersolve(s,x,r,w, mu, lambdasolveloop, gammasolveloop, epsilonsolveloop);
%WATERQUAL Summary of this function goes here
%   Detailed explanation goes here
















%Calculations for the variable susceptible
ds=mu-mu.*s-lambdasolveloop.*s;

s=s+ds;

if s>=1
    s=1;
end

if s<=0
    s=0;
end


%Calculations for the variable infectious
dx=-gammasolveloop.*x+lambdasolveloop.*s-mu.*x;

x=x+dx;

if x>=1
    x=1;
end

if x<=0
    x=0;
end

%Calculations for the variable recovered


dr=gammasolveloop.*r-mu.*r;

r=r+dr;

%r=1-s-x;

if r>=1
    r=1;
end

if r<=0
    r=0;
end



%Calculations for the variable waterquality


dw=epsilonsolveloop.*(x-w);

w=w+dw;




end

