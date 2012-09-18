
for i = 1:1:5
[P, Tc , targets] = getsubj2(i);
P=P';
net{i} = newlvq(minmax(P),60,[0.2 0.2 0.2 0.2 0.2],0.01,'learnlv1');
net{i}.trainParam.epochs = 100;
[net{i},tr,Y,E,Pf,Af] = train(net{i},P,targets);
Y = sim(net{i},P);
Yc = vec2ind(Y);
c = confusion(targets,Y);
acc(i) = (1-c)*100;
end

acc