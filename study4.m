%1,6,11,16,21
clear all
clc
%my_lvq(class,6)
%svm2(class1,class2, channel)
%getsubject(subject,channel)


%% s = subject; ch = channel no; binary: class to class efficiency
s = 1;

[P, Tc , targets] = getsubj2(s);

for i = 1:1:5
    tic
    for j = 1:1:5
    res(i,j) = svm2(i,j);
    %res(i,j) = lvq_ac(i,j);
    end
    toc
end

res