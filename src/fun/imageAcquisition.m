function imageAcquisition(UIAxes, path,name)
% [ret, temperature] = GetTemperature() for temperature 
    [ret,XPixels, YPixels]=GetDetector();
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
        
        
        surf(UIAxes,image_matrix)
        shading(UIAxes,"flat");
        colormap(UIAxes,gray);
        colorbar(UIAxes);
        xlabel(UIAxes,'Pixel in x-axis');
        ylabel(UIAxes,'Pixel in y-axis');
        title(name);
        xlim(UIAxes,[0 XPixels]);
        ylim(UIAxes,[0 YPixels]);
        set(UIAxes,'FontSize',15,'FontWeight','bold','CLim',[0 1000]);
        view(UIAxes,[-270 90]);
        %saveas(gcf,fullfile(path,sprintf('%s.fig',name)));saveas(gcf,fullfile(path,sprintf('%s.png',name)));
        writematrix(image_matrix,fullfile(path,sprintf('%s.dat',name)));
        drawnow;
    end
end