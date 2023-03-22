folder1 = "Kutz 100 #1 Recordings";
folder2 = "Kutz 100 #2 Recordings";

% kutz1Data = {};
% [kutz1Data{1}{1}, kutz1Data{1}{2}, kutz1Data{1}{3}] = data_processing_function(folder1 + "/Open G.wav", "G");
% [kutz1Data{2}{1}, kutz1Data{2}{2}, kutz1Data{2}{3}] = data_processing_function(folder1 + "/Open D.wav", "D");
% [kutz1Data{3}{1}, kutz1Data{3}{2}, kutz1Data{3}{3}] = data_processing_function(folder1 + "/Open A.wav", "A");
% [kutz1Data{4}{1}, kutz1Data{4}{2}, kutz1Data{4}{3}] = data_processing_function(folder1 + "/Open E.wav", "E");
% 
% kutz2Data = {};
% [kutz2Data{1}{1}, kutz2Data{1}{2}, kutz2Data{1}{3}] = data_processing_function(folder2 + "/Open G.wav", "G");
% [kutz2Data{2}{1}, kutz2Data{2}{2}, kutz2Data{2}{3}] = data_processing_function(folder2 + "/Open D.wav", "D");
% [kutz2Data{3}{1}, kutz2Data{3}{2}, kutz2Data{3}{3}] = data_processing_function(folder2 + "/Open A.wav", "A");
% [kutz2Data{4}{1}, kutz2Data{4}{2}, kutz2Data{4}{3}] = data_processing_function(folder2 + "/Open E.wav", "E");

kutz1HarmonicData = {};
[kutz1HarmonicData{1}{1}, kutz1HarmonicData{1}{2}, kutz1HarmonicData{1}{3}] = data_processing_function(folder1 + "/Harmonic G.wav", "G");
[kutz1HarmonicData{2}{1}, kutz1HarmonicData{2}{2}, kutz1HarmonicData{2}{3}] = data_processing_function(folder1 + "/Harmonic D.wav", "D");
[kutz1HarmonicData{3}{1}, kutz1HarmonicData{3}{2}, kutz1HarmonicData{3}{3}] = data_processing_function(folder1 + "/Harmonic A.wav", "A");
[kutz1HarmonicData{4}{1}, kutz1HarmonicData{4}{2}, kutz1HarmonicData{4}{3}] = data_processing_function(folder1 + "/Harmonic E.wav", "E");

kutz2HarmonicData = {};
[kutz2HarmonicData{1}{1}, kutz2HarmonicData{1}{2}, kutz2HarmonicData{1}{3}] = data_processing_function(folder2 + "/Harmonic G.wav", "G");
[kutz2HarmonicData{2}{1}, kutz2HarmonicData{2}{2}, kutz2HarmonicData{2}{3}] = data_processing_function(folder2 + "/Harmonic D.wav", "D");
[kutz2HarmonicData{3}{1}, kutz2HarmonicData{3}{2}, kutz2HarmonicData{3}{3}] = data_processing_function(folder2 + "/Harmonic A.wav", "A");
[kutz2HarmonicData{4}{1}, kutz2HarmonicData{4}{2}, kutz2HarmonicData{4}{3}] = data_processing_function(folder2 + "/Harmonic E.wav", "E");

doSubplot = true;

if(doSubplot == false)
    for i = 1:4
        figure(i)
        legend("Kutz 100 #1", "Kutz 100 #2")
    
        plot(kutz1HarmonicData{i}{1}, kutz1HarmonicData{i}{2})
        hold on
        plot(kutz2HarmonicData{i}{1}, kutz2HarmonicData{i}{2})
    
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
end

if(doSubplot == true) 
    for i = 1:4
        figure(i)

        ax(1) = subplot(1,2,1)
        plot(kutz1HarmonicData{i}{1}, kutz1HarmonicData{i}{2})

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

        ax(2) = subplot(1,2,2)
        plot(kutz2HarmonicData{i}{1}, kutz2HarmonicData{i}{2})

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

        linkaxes([ax(1), ax(2)], 'y')
    end
end

