function filename(filename,threshold)

M=load(filename);
X=M(2:end,1);
R=M(2:end,2:end);
T=sum(R,2);
LI=(T>threshold)
Y=T(LI)
Z=X(LI)


for i=1:length(Y)
 
 fprintf('State %s: # of transplants %d\n',GetStateName(Z(i)),Y(i));
end
end
