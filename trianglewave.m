function trianglewave()

n = 1:25
A = 0:0.04:0.96
L=1;
s = (-2.*A.*L.*L.*cos(n.*pi))./n.*pi;
t = (2.*A.*L.*L.*sin(n.*pi))./(n.*n.*pi.*pi);
r= s+t;
plot (n,r)   
   

end