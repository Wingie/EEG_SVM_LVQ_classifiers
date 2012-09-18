%1,6,11,16,21
clear all
clc
%my_lvq(1,6)
%svm2(class1,class2, channel)
%getsubject(subject,channel)

s = 5;

%% ANN For one subjects on all 5 channnels; 5 classes as targets
tic
for i = 1:1:5
[P,Tc, targets] = getsubj2(i);
P = P'; % for nn only
accnn(i) = ann_multi(P,targets);
end
accnn = accnn 
[mnn,inn] = max(accnn) 
toc
%% SVM for one subject all channels; 5 classes as targets
tic
for i = 1:1:5
[P,Tc, targets] = getsubj2(i);
accsvm(i) = svm3(P,Tc);
end
accsvm = accsvm
[msvm,isvm] = max(accsvm)
toc