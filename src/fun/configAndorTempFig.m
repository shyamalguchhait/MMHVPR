function configAndorTempFig(checkButton,tempLabel)
    [ret,temp]=GetTemperature();  
    tempLabel.Text = string(temp);

