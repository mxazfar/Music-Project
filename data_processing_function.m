function [f, spectrum, intensities] = data_processing_function(fileName, string)

% Import audio file, read
[y, Fs] = audioread(fileName);

% Trim audio file if necessary
% samples = floor([1 + 3.9*Fs, length(y) - 1*Fs]);
% y = audioread(audioFile, samples);

% Calculate FFT of audio, plot it
L = length(y);
Y = fft(y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
spectrum = P1;

% Generate maximum amount of harmonics based on sampling frequency,
% determine all possible harmonic frquencies.
%fundamental = 196;

fundamental = 0;

if(string == "G")
    fundamental = 196;
end
if(string == "D")
    fundamental = 293.7;
end
if(string == "A")
    fundamental = 440;
end
if(string == "E")
    fundamental = 659.3;
end


max_harmonic = floor((Fs/2)/fundamental);
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

intensities = harmonic_intensities;

end

