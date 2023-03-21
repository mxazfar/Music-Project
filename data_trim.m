clear
clc

% Import audio file, read
audioFile = "John Cheng Recordings\ZOOM0009.wav";
[y, Fs] = audioread(audioFile);

% Trim audio file 
samples = floor([1 + 4.2*Fs, length(y) - 0.8*Fs]);
y = audioread(audioFile, samples);

plot(y(:,1));