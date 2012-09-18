%11/21 0%

i = 6;

task1 = data{21}{4};
t1 = task1(i,:);
t1 = t1(1:2500);
set = reshape(t1,100,25);

f1 = getfeatures(set);

task2 = data{6}{4};
t2 = task2(i,:);
t2 = t2(1:2500);
set = reshape(t2,100,25);

f2 = getfeatures(set);

task = data{11}{4};
t = task(i,:);
t = t(1:2500);
set = reshape(t,100,25);

f3 = getfeatures(set);


task = data{16}{4};
t = task(i,:);
t = t(1:2500);
set = reshape(t,100,25);

f4 = getfeatures(set);

task = data{1}{4};
t = task(i,:);
t = t(1:2500);
set = reshape(t,100,25);

f5 = getfeatures(set);


t1 = [1 1 1 1 1];
t2 = [2 2 2 2 2];
t3 = [3 3 3 3 3];
t4 = [4 4 4 4 4];
t5 = [5 5 5 5 5];
P = [f1 f2 f3 f4 f5];
%LVQ
Tc = [t1 t1 t1 t1 t1 t2 t2 t2 t2 t2 t3 t3 t3 t3 t3 t4 t4 t4 t4 t4 t5 t5 t5 t5 t5];
T = ind2vec(Tc);
targets = full(T);

net = newlvq(P,4,[0.2 0.2 0.2 0.2 0.2]);
 
net.trainParam.epochs = 150;
net = train(net,P,targets);
tic
Y = sim(net,P);
Yc = vec2ind(Y);
toc