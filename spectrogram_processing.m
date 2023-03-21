%% 3D Spectrogram
[y, fs] = audioread("Kutz 100 #1 Recordings\G Scale.wav");
y = y(:,1);

M = 1000;
L = 11;
g = bartlett(M);
Ndft = 2^14;

[s,f,t] = spectrogram(y,g,L,Ndft,fs);

[T, F] = meshgrid(t,f);
figure(1)


plot3(F, T, abs(s))
xlabel("Frequency (Hz)")
ylabel("Time (s)")
zlabel("Intensity")

%% 2D Spectrogram

[y, fs] = audioread("Kutz 100 #1 Recordings\G Scale.wav");
y = y(:,1);

spectrogram(y,100,80,5000,fs,'yaxis')