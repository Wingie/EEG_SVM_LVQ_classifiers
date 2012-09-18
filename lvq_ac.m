%11/21 0% LVQ function taking input for all classes
function acc = my_lvq(n1,n2)
arr = [1 6 11 16 21];
n1 = arr(n1);
n2 = arr(n2);

load eegdata;
%% first
task1 = data{n1}{4};
t = [];
for i = 1:1:5
t = [t ; task1(i,:)];
end
for i = 1:1:5
set{i} = reshape(t(i,:),100,25);
end
f1 = [];
for i =1:1:5
f1 =[f1; getfeatures(set{i})];
end
%% second
task2 = data{n2}{4};
t = [];
for i = 1:1:5
t = [t ; task2(i,:)];
end
for i = 1:1:5
set{i} = reshape(t(i,:),100,25);
end
f2 = [];
for i =1:1:5
f2 =[f2; getfeatures(set{i})];
end
t1 = [1 1 1 1 1];
t2 = [2 2 2 2 2];

P = [f1 f2];
%LVQ
Tc = [t1 t1 t1 t1 t1 t2 t2 t2 t2 t2];
T = ind2vec(Tc);
targets = full(T);

net = newlvq(P,4,[0.5 0.5]);
 
net.trainParam.epochs = 1000;
[net,tr,Y,E,Pf,Af] = train(net,P,targets);

Y = sim(net,P);
Yc = vec2ind(Y);
c = confusion(targets,Y);
acc = (1-c)*100;

