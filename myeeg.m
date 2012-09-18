%load eegdata
function ft = getfeatures(set)
%Extract and plot one trial from subject 1 

%calculate features
mn = mean(set);
vr = var(set);
sk = skewness(set);
kr = kurtosis(set);
rms = sqrt(sum(set.*conj(set))/size(set,1));
apwr = sum(abs(set).^2)/length(set);

%features go down as one batch of i/p
ft = [mn;vr;sk;kr;rms;apwr];








