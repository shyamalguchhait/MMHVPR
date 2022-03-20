
disp('Single Scan Example')
% init system

disp('Initialising Camera');
ret=AndorInitialize('');
CheckError(ret);

disp('Configuring Acquisition');
[ret]=CoolerON();                             %   Turn on temperature cooler
CheckWarning(ret);
[ret]=SetTemperature(-60);                    %   Setting Cooler temperature
CheckWarning(ret);


[ret] = SetHSSpeed(0, 3);                     %   Setting HSS Speed= 0.05Mhz=50Khz
CheckWarning(ret);
[ret] = SetVSSpeed(4);                     %   Setting VSS Speed= 0.05Mhz=50Khz
CheckWarning(ret);

% [ret]=GetTemperature();                    %   Setting Cooler temperature
% CheckWarning(ret);

%[ret, speed] = GetHSSpeed(0, 0, 3)  0.05Mhz=50Khz
%[ret, speed] = GetVSSpeed(4)    67.29 Khz
[ret]=SetAcquisitionMode(1);                  %   Set acquisition mode; 1 for Single Scan
CheckWarning(ret);
[ret]=SetExposureTime(0.1);                  %   Set exposure time in second
CheckWarning(ret);
[ret]=SetReadMode(4);                         %   Set read mode; 4 for Image
CheckWarning(ret);
[ret]=SetTriggerMode(0);                      %   Set internal trigger mode
CheckWarning(ret);
[ret]=SetShutter(1, 0, 0, 0);                 %   Open Shutter
CheckWarning(ret);
[ret,XPixels, YPixels]=GetDetector();         %   Get the CCD size
CheckWarning(ret);
[ret]=SetImage(1, 1, 1, XPixels, 1, YPixels); %   Set the image size
CheckWarning(ret);
%% jkfdk 
for i=1:5
% [ret, temperature] = GetTemperature() for temperature  
    disp('Starting Acquisition');
    [ret] = StartAcquisition();                   
    CheckWarning(ret);

    [ret] = WaitForAcquisition();
    CheckWarning(ret);

    [ret, imageData] = GetMostRecentImage(XPixels * YPixels);
    CheckWarning(ret);

    if ret == atmcd.DRV_SUCCESS
        %display the acquired image
        %imagesc(flipdim(transpose(reshape(imageData, XPixels, YPixels)),1));
        image_matrix=(flipdim(transpose(reshape(imageData, XPixels, YPixels)),1));
        
        
        surf(image_matrix)
        shading flat
        colormap(gray)
        colorbar 
        xlabel('Pixel in x-axis')
        ylabel('Pixel in y-axis')
        title(['Angle=30 deg']);
        xlim([0 512])
        ylim([0 512])
        set(gca,'FontSize',15,'FontWeight','bold','CLim',[0 1000])
        view([-270 90])
        saveas(gcf,sprintf('%d.dat',i))
        drawnow;

    end
end
%% jhds 

disp('Acquisition Complete! Cleaning Up and Shutting Down');
[ret]=AbortAcquisition;
CheckWarning(ret);
% [ret]=SetShutter(1, 2, 1, 1);
% CheckWarning(ret);
[ret]=AndorShutDown;
CheckWarning(ret);
disp('Done, please I am stuck inside the computer')

