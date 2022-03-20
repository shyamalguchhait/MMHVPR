function configAndor(t)
    disp('Initialising Camera');
    ret=AndorInitialize('');
    CheckError(ret);

    disp('Configuring Acquisition');
    [ret]=CoolerON();                             %   Turn on temperature cooler
    CheckWarning(ret);
    [ret]=SetTemperature(-70);                    %   Setting Cooler temperature
    CheckWarning(ret);


    [ret] = SetHSSpeed(0, 1);                     %   Setting HSS Speed= 0.05Mhz=50Khz
    CheckWarning(ret);
    [ret] = SetVSSpeed(1);                     %   Setting VSS Speed= 0.05Mhz=50Khz
    CheckWarning(ret);

    % [ret]=GetTemperature();                    %   Setting Cooler temperature
    % CheckWarning(ret);

    %[ret, speed] = GetHSSpeed(0, 0, 3)  0.05Mhz=50Khz
    %[ret, speed] = GetVSSpeed(4)    67.29 Khz 
    [ret]=SetAcquisitionMode(1);                  %   Set acquisition mode; 1 for Single Scan
    CheckWarning(ret);
    [ret]=SetExposureTime(t);                  %   Set exposure time in second
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

