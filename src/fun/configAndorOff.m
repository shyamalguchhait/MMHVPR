function configAndorOff
    disp('Acquisition Complete! Cleaning Up and Shutting Down');
    [ret]=AbortAcquisition;
    CheckWarning(ret);
    % [ret]=SetShutter(1, 2, 1, 1);
    % CheckWarning(ret);
    [ret]=AndorShutDown;
    CheckWarning(ret);
    disp('Done, please I am stuck inside the computer')

