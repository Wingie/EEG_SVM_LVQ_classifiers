%LVQ
P = [-4.337801,0.6533760,-2.301248,-1.609824,3.575527,-3.064504,10.62031,7.353103,5.698344,0.8964239;17.56846,12.89645,15.29616,17.77213,11.18301,29.66080,54.30176,16.04096,27.74317,21.65446;-0.08247480,-0.1581840,-0.2055034,-0.05789354,-0.4385860,0.7073776,0.1330519,-0.2001666,-0.1298388,-0.1266729;2.622183,3.155180,2.665267,2.452344,3.083494,3.067865,2.635548,3.284251,2.866793,2.375842;6.017415,3.632407,4.520944,4.492877,4.884218,6.225382,12.90542,8.363534,7.741890,4.716089;36.20928,13.19438,20.43894,20.18595,23.85558,38.75538,166.5498,69.94870,59.93686,22.24150;]

Tc = [1 1 1 1 1 2 2 2 2 2];
T = ind2vec(Tc);
targets = full(T);

net = newlvq(P,4,[.5 .5]);
 

net.trainParam.epochs = 150;
tic
net = train(net,P,T);
toc
Y = sim(net,P);
Yc = vec2ind(Y)