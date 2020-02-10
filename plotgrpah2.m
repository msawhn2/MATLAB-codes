function plotgrpah2()
F=(sqrt(0.0602/0.00214))/(2*pi);
f= 0:0.05:2; 
%%Q=[10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 10 ];
for Q = [4 6 8 9 10]
d= (((F*f)./Q)./(F.^2-f.^2));
D=atan(d);
hold on 
[value, index] = max(D); 
plot(f(1:index), D(1:index)+1.6);
[value, index] = min(D); 

plot(f(index:end)-0.079, D(index:end)+3.7); 
hold off
xlabel('Frequency');
ylabel('Delta');
legend('Q=4','Q=6','Q=8','Q=9','Q=10');
%%hold off 
%%[value, index] = max(D); 
%%plot(f(1:index), D(1:index)); 



end