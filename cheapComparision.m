folder1 = "Kutz 100 #1 Recordings";
folder2 = "Kutz 100 #2 Recordings";

kutz1Data = {};
[kutz1Data{1}{1}, kutz1Data{1}{2}, kutz1Data{1}{3}] = data_processing_function(folder1 + "/Open G.wav", "G");
[kutz1Data{2}{1}, kutz1Data{2}{2}, kutz1Data{2}{3}] = data_processing_function(folder1 + "/Open D.wav", "D");
[kutz1Data{3}{1}, kutz1Data{3}{2}, kutz1Data{3}{3}] = data_processing_function(folder1 + "/Open A.wav", "A");
[kutz1Data{4}{1}, kutz1Data{4}{2}, kutz1Data{4}{3}] = data_processing_function(folder1 + "/Open E.wav", "E");

kutz2Data = {};
[kutz2Data{1}{1}, kutz2Data{1}{2}, kutz2Data{1}{3}] = data_processing_function(folder2 + "/Open G.wav", "G");
[kutz2Data{2}{1}, kutz2Data{2}{2}, kutz2Data{2}{3}] = data_processing_function(folder2 + "/Open D.wav", "D");
[kutz2Data{3}{1}, kutz2Data{3}{2}, kutz2Data{3}{3}] = data_processing_function(folder2 + "/Open A.wav", "A");
[kutz2Data{4}{1}, kutz2Data{4}{2}, kutz2Data{4}{3}] = data_processing_function(folder2 + "/Open E.wav", "E");

for i = 1:4
    figure(i)
    legend("Kutz 100 #1", "Kutz 100 #2")

    plot(kutz1Data{i}{1}, kutz1Data{i}{2})
    hold on
    plot(kutz2Data{i}{1}, kutz2Data{i}{2})

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

    stem(kutz1Data{i}{3})
    hold on
    stem(kutz2Data{i}{3})

    switch(i)
        case 1
            title("Open G Harmonics")
        case 2
            title("Open D Harmonics")
        case 3
            title("Open A Harmonics")
        case 4
            title("Open E Harmonics")
    end

    xlabel("Harmonic")
    ylabel("Intensity")
end


