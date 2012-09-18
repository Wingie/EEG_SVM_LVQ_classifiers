Fs = 1024;                      % Sampling frequency
t  = 0:1/Fs:1-(1/Fs);           % Time vector
A  = 1;                         % Peak amplitude
F1 = 128;                       % Hz
x  = t;         % Sinusoidal signal

power_timedomain = sum(abs(t).^2)/length(t)