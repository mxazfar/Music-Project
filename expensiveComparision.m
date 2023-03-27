folder1 = "My Violin Recordings";
folder2 = "John Cheng Recordings";

myViolinData = {};

[myViolinData{1}{1}, myViolinData{1}{2}, myViolinData{1}{3}] = data_processing_function(folder1 + "/Open G.wav", "G");
[myViolinData{2}{1}, myViolinData{2}{2}, myViolinData{2}{3}] = data_processing_function(folder1 + "/Open D.wav", "D");
[myViolinData{3}{1}, myViolinData{3}{2}, myViolinData{3}{3}] = data_processing_function(folder1 + "/Open A.wav", "A");
[myViolinData{4}{1}, myViolinData{4}{2}, myViolinData{4}{3}] = data_processing_function(folder1 + "/Open E.wav", "E");

chengData = {};

[chengData{1}{1}, chengData{1}{2}, chengData{1}{3}] = data_processing_function(folder2 + "/Open G.wav", "G");
[chengData{2}{1}, chengData{2}{2}, chengData{2}{3}] = data_processing_function(folder2 + "/Open D.wav", "D");
[chengData{3}{1}, chengData{3}{2}, chengData{3}{3}] = data_processing_function(folder2 + "/Open A.wav", "A");
% 
% myViolinHarmonicData = {};
% [myViolinHarmonicData{1}{1}, myViolinHarmonicData{1}{2}, myViolinHarmonicData{1}{3}] = data_processing_function(folder1 + "/Harmonic G.wav", "G");
% [myViolinHarmonicData{2}{1}, myViolinHarmonicData{2}{2}, myViolinHarmonicData{2}{3}] = data_processing_function(folder1 + "/Harmonic D.wav", "D");
% [myViolinHarmonicData{3}{1}, myViolinHarmonicData{3}{2}, myViolinHarmonicData{3}{3}] = data_processing_function(folder1 + "/Harmonic A.wav", "A");
% [myViolinHarmonicData{4}{1}, myViolinHarmonicData{4}{2}, myViolinHarmonicData{4}{3}] = data_processing_function(folder1 + "/Harmonic E.wav", "E");
% 
% chengHarmonicData = {};
% [chengHarmonicData{1}{1}, chengHarmonicData{1}{2}, chengHarmonicData{1}{3}] = data_processing_function(folder2 + "/Harmonic G.wav", "G");
% [chengHarmonicData{2}{1}, chengHarmonicData{2}{2}, chengHarmonicData{2}{3}] = data_processing_function(folder2 + "/Harmonic D.wav", "D");
% [chengHarmonicData{3}{1}, chengHarmonicData{3}{2}, chengHarmonicData{3}{3}] = data_processing_function(folder2 + "/Harmonic A.wav", "A");

doSubplot = false;

if(doSubplot ==  false)
    for i = 1:4
        figure(i)
        legend("Kono", "John Cheng")
    
        plot(myViolinData{i}{1}, myViolinData{i}{2})
        
        if(i ~= 4) 
            hold on
            plot(chengData{i}{1}, chengData{i}{2})
        end
    
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
        
        if(i ~= 4)
            hold on
            stem(chengData{i}{3})
        end
    
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
        plot(myViolinHarmonicData{i}{1}, myViolinHarmonicData{i}{2})

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
        plot(chengHarmonicData{i}{1}, chengHarmonicData{i}{2})

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
