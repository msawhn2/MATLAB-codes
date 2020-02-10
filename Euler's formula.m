% solves dy/dt = 1/(1+y) y(t=0)=0
% using Euler forward for time when y=1

function compute(N)
h=1/N % step's size
 % N= number of steps
y(1)=0;%The first index of array is 0
for n=1:N %
    
y(n+1)= y(n)+h*(1+y(n).^2)%Euler's formula

if y(n+1)>=1.00 & y(n+1)<1.3
    t=1/y(n+1);
    display(t)% displays the value of t0 for which y(t0)=1
end

end
end


