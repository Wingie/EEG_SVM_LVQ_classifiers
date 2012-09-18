%v = adc(5);

%class 1
set = reshape(v,100,5);
f1 = getfeatures(set);

%class 2
set = reshape(v,100,5);
f2 = getfeatures(set);

t1 = [1 1 1 1 1];
t2 = [2 2 2 2 2];
P = [f1 f2];
Tc = [t1 t2];