function acc = lvq_full(inputs,targets)


numHiddenNeurons = 75; 
net = newpr(inputs,targets,numHiddenNeurons);
% Train n/w
[net,tr] = train(net,inputs,targets);
outputs = sim(net,inputs);

% Plot performance
plotperf(tr)

[c,cm,ind,per] = confusion(targets,outputs);
acc = (1-c)*100;
