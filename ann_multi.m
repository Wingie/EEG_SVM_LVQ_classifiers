function acc = ann_multi(inputs,targets)


numHiddenNeurons = 75; 
net = newpr(inputs,targets,numHiddenNeurons);
net.divideParam.trainRatio = 70/100;  
net.divideParam.valRatio = 15/100;  
net.divideParam.testRatio = 15/100;  

% Train n/w
[net,tr] = train(net,inputs,targets);
outputs = sim(net,inputs);

% Plot performance
plotperf(tr)

[c,cm,ind,per] = confusion(targets,outputs);
acc = (1-c)*100;
