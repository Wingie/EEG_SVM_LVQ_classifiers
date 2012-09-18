%function svm(i)

clc
load eegdata
%11/21 0%
i=2;
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
P = [f1 f2 f3 f4 f5]';
%LVQ
Tc = [t1 t1 t1 t1 t1 t2 t2 t2 t2 t2 t3 t3 t3 t3 t3 t4 t4 t4 t4 t4 t5 t5 t5 t5 t5]';
T = ind2vec(Tc);
targets = full(T);
%SVM
tic
model = svmtrain(Tc,P, '-s 0 -t 2 -c 2 -g 0.07 -s 0 -e 0.0000001');
[predict_label, accuracy, dec_values] = svmpredict(Tc,P, model); % test the training data
toc