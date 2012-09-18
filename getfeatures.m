%load eegdata
function ft = getfeatures(set);
 
 
%calculate features
mn = mean(set);
vr = var(set);
sk = skewness(set);
kr = kurtosis(set);
rms = sqrt(sum(set.*conj(set))/size(set,1));
apwr = sum(abs(set).^2)/length(set);
 
%features go down as one batch of i/p
ft = [mn;vr;sk;kr;rms;apwr];
ft = double(ft);
