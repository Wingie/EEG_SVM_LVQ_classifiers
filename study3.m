%function res=study3(s)
%1,6,11,16,21
ch = 1
clc
%my_lvq(1,6)
%svm2(class1,class2, channel)
%getsubject(subject,channel)


%ch = 3;
mat = [];
for s = 1:1:5
[P, Tc , targets] = getsubj2(s);
%% get svm model from first subj and test with iother subject data

[acc, model] = svm3(P,Tc);
disp 'next'
for i=1:1:5
    c = 'with subj ';
    d = num2str(i);
    d = strcat(c,d);
    disp(d)
[P, Tc , targets] = getsubj2(i);
[predict_label, accuracy, dec_values] = svmpredict(Tc,P, model);
acc(i) = accuracy(1);
end
mat = [mat;acc];

end

%accuracy matrix
mat
