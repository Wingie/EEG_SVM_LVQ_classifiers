%11/21 0%
function acc = my_lvq(n1,n2,i)
arr = [1 6 11 16 21];
n1 = arr(n1);
n2 = arr(n2);

load eegdata;
task1 = data{n1}{4};
t1 = task1(i,:);
t1 = t1(1:2500);
set = reshape(t1,100,25);

f1 = getfeatures(set);
task2 = data{n2}{4};
t2 = task2(i,:);
t2 = t2(1:2500);
set = reshape(t2,100,25);

f2 = getfeatures(set);

t1 = [1 1 1 1 1];
t2 = [2 2 2 2 2];

P = [f1 f2];
%LVQ
Tc = [t1 t1 t1 t1 t1 t2 t2 t2 t2 t2];
T = ind2vec(Tc);
targets = full(T);

net = newlvq(P,4,[0.5 0.5]);
 
net.trainParam.epochs = 100;
[net,tr,Y,E,Pf,Af] = train(net,P,targets);

Y = sim(net,P);
Yc = vec2ind(Y);
c = confusion(targets,Y);
acc = (1-c)*100;

