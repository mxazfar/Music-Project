clear
clc

% Import audio file, read
audioFile = "Kutz 100 #1 Recordings\Open G.wav";
[y, Fs] = audioread(audioFile);

% Trim audio file if necessary
% samples = floor([1 + 3.9*Fs, length(y) - 1*Fs]);
% y = audioread(audioFile, samples);

% Plot time series of audio
figure(1)
plot(y(:,1))

% Calculate FFT of audio, plot it
L = length(y);
Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure(2)
plot(f, P1);
xlabel("Frequency (Hz)");
ylabel("Intensity");
title("FFT");

% Generate maximum amount of harmonics based on sampling frequency,
% determine all possible harmonic frquencies.
fundamental = 196;
max_harmonic = floor((Fs/2)/196);
harmonic_frequencies = [];

for i = 1:max_harmonic
    harmonic_frequencies(i) = fundamental*i;
end 

% Peak won't necessarily be at harmonic frequency due to spectral leakage,
% so calculate a bound around harmonic frequency
harmonic_bounds = {};
harmonic_indicies = {};

for i = 1:max_harmonic
    harmonic_bounds{1,i} = f((f > harmonic_frequencies(i)-1) & (f < harmonic_frequencies(i)+1));
end

harmonic_intensities = [];

for i = 1:length(harmonic_frequencies)
    tempMax = 0;
    
    for j = 1:length(harmonic_bounds{1, i})
        harmonicIndicie = find(f == harmonic_bounds{1,i}(j));

        if(P1(harmonicIndicie) > tempMax) 
            tempMax = P1(harmonicIndicie);
        end
    end
    
    harmonic_intensities(i) = tempMax;
end

figure(3)
stem(1:1:max_harmonic, harmonic_intensities);
xlabel("Harmonic");
ylabel("Intensity");
title("Harmonic vs. Intensity");

%testing this is GIT