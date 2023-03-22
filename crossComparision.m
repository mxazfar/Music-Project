folder1 = "My Violin Recordings";
folder2 = "Kutz 100 #1 Recordings";

myViolinData = {};

[myViolinData{1}{1}, myViolinData{1}{2}, myViolinData{1}{3}] = data_processing_function(folder1 + "/Open G.wav", "G");
[myViolinData{2}{1}, myViolinData{2}{2}, myViolinData{2}{3}] = data_processing_function(folder1 + "/Open D.wav", "D");
[myViolinData{3}{1}, myViolinData{3}{2}, myViolinData{3}{3}] = data_processing_function(folder1 + "/Open A.wav", "A");
[myViolinData{4}{1}, myViolinData{4}{2}, myViolinData{4}{3}] = data_processing_function(folder1 + "/Open E.wav", "E");

kutz1Data = {};

[kutz1Data{1}{1}, kutz1Data{1}{2}, kutz1Data{1}{3}] = data_processing_function(folder2 + "/Open G.wav", "G");
[kutz1Data{2}{1}, kutz1Data{2}{2}, kutz1Data{2}{3}] = data_processing_function(folder2 + "/Open D.wav", "D");
[kutz1Data{3}{1}, kutz1Data{3}{2}, kutz1Data{3}{3}] = data_processing_function(folder2 + "/Open A.wav", "A");
[kutz1Data{4}{1}, kutz1Data{4}{2}, kutz1Data{4}{3}] = data_processing_function(folder2 + "/Open E.wav", "E");

myViolinHarmonicData = {};
[myViolinHarmonicData{1}{1}, myViolinHarmonicData{1}{2}, myViolinHarmonicData{1}{3}] = data_processing_function(folder1 + "/Harmonic G.wav", "G");
[myViolinHarmonicData{2}{1}, myViolinHarmonicData{2}{2}, myViolinHarmonicData{2}{3}] = data_processing_function(folder1 + "/Harmonic D.wav", "D");
[myViolinHarmonicData{3}{1}, myViolinHarmonicData{3}{2}, myViolinHarmonicData{3}{3}] = data_processing_function(folder1 + "/Harmonic A.wav", "A");
[myViolinHarmonicData{4}{1}, myViolinHarmonicData{4}{2}, myViolinHarmonicData{4}{3}] = data_processing_function(folder1 + "/Harmonic E.wav", "E");

kutz1HarmonicData = {};
[kutz1HarmonicData{1}{1}, kutz1HarmonicData{1}{2}, kutz1HarmonicData{1}{3}] = data_processing_function(folder1 + "/Harmonic G.wav", "G");
[kutz1HarmonicData{2}{1}, kutz1HarmonicData{2}{2}, kutz1HarmonicData{2}{3}] = data_processing_function(folder1 + "/Harmonic D.wav", "D");
[kutz1HarmonicData{3}{1}, kutz1HarmonicData{3}{2}, kutz1HarmonicData{3}{3}] = data_processing_function(folder1 + "/Harmonic A.wav", "A");
[kutz1HarmonicData{4}{1}, kutz1HarmonicData{4}{2}, kutz1HarmonicData{4}{3}] = data_processing_function(folder1 + "/Harmonic E.wav", "E");

for i = 1:4
    figure(i)
    legend('Kutz 100 #1', 'Kutz 100 #2')

    plot(myViolinData{i}{1}, myViolinData{i}{2})
    hold on
    plot(kutz1Data{i}{1}, kutz1Data{i}{2})

    switch(i)
        case 1
            title("Open G Spectrum")
        case 2
            title("Open D Spectrum")
        case 3
            title("Open A Spectrum")
        case 4
            title("Open E Spectrum")
    end

    xlabel("Frequency (Hz)")
    ylabel("Intensity")



    figure(i+4)

    stem(myViolinData{i}{3})
    hold on
    stem(kutz1Data{i}{3})

    switch(i)
        case 1
            title("Open G Harmonic Intensities")
        case 2
            title("Open D Harmonic Intensities")
        case 3
            title("Open A Harmonic Intensities")
        case 4
            title("Open E Harmonic Intensities")
    end

    xlabel("Harmonic")
    ylabel("Intensity")
end