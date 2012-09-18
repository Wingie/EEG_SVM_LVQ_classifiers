function [P, Tc , targets] = getsubj2(n)

if(n>5)
    disp 'nonsense'
    pause
end 
load eegdata;
%% first
task1 = data{n}{4};
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
n= n +5;
task2 = data{n}{4};
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
%% third
task3 = data{n}{4};
t = [];
for i = 1:1:5
t = [t ; task3(i,:)];
end
for i = 1:1:5
set{i} = reshape(t(i,:),100,25);
end
f3 = [];
for i =1:1:5
f3 =[f3; getfeatures(set{i})];
end
%% 4th
n= n +5;
task4 = data{n}{4};
t = [];
for i = 1:1:5
t = [t ; task4(i,:)];
end
for i = 1:1:5
set{i} = reshape(t(i,:),100,25);
end
f4 = [];
for i =1:1:5
f4 =[f4; getfeatures(set{i})];
end
%% fifth
n= n +5;
task = data{n}{4};
t = [];
for i = 1:1:5
t = [t ; task(i,:)];
end
for i = 1:1:5
set{i} = reshape(t(i,:),100,25);
end
f5 = [];
for i =1:1:5
f5 =[f5; getfeatures(set{i})];
end
%%
t1 = [1 1 1 1 1];
t2 = [2 2 2 2 2];
t3 = [3 3 3 3 3];
t4 = [4 4 4 4 4];
t5 = [5 5 5 5 5];
P = [f1 f2 f3 f4 f5]';
%LVQ
Tc = [t1 t1 t1 t1 t1 t2 t2 t2 t2 t2 t3 t3 t3 t3 t3 t4 t4 t4 t4 t4 t5 t5 t5 t5 t5]';
T = ind2vec(Tc);
targets = full(T);