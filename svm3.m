function [accuracy, model] = svm3(P,Tc)
load eegdata;

%SVM

model = svmtrain(Tc,P, '-s 1 -t 2 -d 9 -c 2 -g 0.07 -s 0 -e 0.0000001 -q');
[predict_label, accuracy, dec_values] = svmpredict(Tc,P, model); % test the training data
accuracy = accuracy(1);

