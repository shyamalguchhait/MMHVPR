clear; close all; clc;
%
global h;
SN = readtable("SN.csv");
ang = readtable("angle.csv");
format("long");
% Create UIFigure and hide until all components are created
UIFigure = uifigure('Visible', 'off', 'HandleVisibility', 'on');
UIFigure.Position = [0 0 1148 780];
UIFigure.Name = 'MATLAB App';

% Create UIAxes
UIAxes = uiaxes(  UIFigure);
title(  UIAxes, 'intensity')
xlabel(  UIAxes, 'pixel no.')
ylabel(  UIAxes, 'pixel no.')
zlabel(  UIAxes, 'Z')
UIAxes.FontSize = 20;
UIAxes.Position = [522 263 612 456];

% Create AnglePanel
AnglePanel = uipanel(  UIFigure);
AnglePanel.Title = 'Angle';
AnglePanel.Position = [26 259 200 412];

% Create P1EditFieldLabel
P1EditFieldLabel = uilabel(  AnglePanel);
P1EditFieldLabel.HorizontalAlignment = 'right';
P1EditFieldLabel.Position = [17 342 25 22];
P1EditFieldLabel.Text = 'P1';

% Create P1EditField
P1EditField = uieditfield(  AnglePanel, 'numeric');
P1EditField.Position = [56 342 97 22];
P1EditField.Value = ang.P1;

% Create Q1EditFieldLabel
Q1EditFieldLabel = uilabel(  AnglePanel);
Q1EditFieldLabel.HorizontalAlignment = 'right';
Q1EditFieldLabel.Position = [17 263 25 22];
Q1EditFieldLabel.Text = 'Q1';

% Create Q1EditField
Q1EditField = uieditfield(  AnglePanel, 'numeric');
Q1EditField.Position = [56 263 97 22];
Q1EditField.Value = ang.Q1;

% Create Q2EditFieldLabel
Q2EditFieldLabel = uilabel(  AnglePanel);
Q2EditFieldLabel.HorizontalAlignment = 'right';
Q2EditFieldLabel.Position = [17 184 25 22];
Q2EditFieldLabel.Text = 'Q2';

% Create Q2EditField
Q2EditField = uieditfield(  AnglePanel, 'numeric');
Q2EditField.Position = [56 184 97 22];
Q2EditField.Value = ang.Q2;

% Create P2EditFieldLabel
P2EditFieldLabel = uilabel(  AnglePanel);
P2EditFieldLabel.HorizontalAlignment = 'right';
P2EditFieldLabel.Position = [17 105 25 22];
P2EditFieldLabel.Text = 'P2';

% Create P2EditField
P2EditField = uieditfield(  AnglePanel, 'numeric');
P2EditField.Position = [56 105 97 22];
P2EditField.Value = ang.P2;

% Create SNNoPanel
SNNoPanel = uipanel(  UIFigure);
SNNoPanel.Title = 'SN No';
SNNoPanel.Position = [248 259 258 412];

% Create SNP1EditFieldLabel
SNP1EditFieldLabel = uilabel(  SNNoPanel);
SNP1EditFieldLabel.HorizontalAlignment = 'right';
SNP1EditFieldLabel.Position = [28 342 37 22];
SNP1EditFieldLabel.Text = 'SNP1';

% Create SNP1EditField
SNP1EditField = uieditfield(  SNNoPanel, 'numeric');
SNP1EditField.Position = [80 342 100 22];
SNP1EditField.Value = SN.P1;

% Create SNQ1EditFieldLabel
SNQ1EditFieldLabel = uilabel(  SNNoPanel);
SNQ1EditFieldLabel.HorizontalAlignment = 'right';
SNQ1EditFieldLabel.Position = [28 263 38 22];
SNQ1EditFieldLabel.Text = 'SNQ1';

% Create SNQ1EditField
SNQ1EditField = uieditfield(  SNNoPanel, 'numeric');
SNQ1EditField.Position = [81 263 100 22];
SNQ1EditField.Value = SN.Q1;

% Create SNQ2EditFieldLabel
SNQ2EditFieldLabel = uilabel(  SNNoPanel);
SNQ2EditFieldLabel.HorizontalAlignment = 'right';
SNQ2EditFieldLabel.Position = [28 184 38 22];
SNQ2EditFieldLabel.Text = 'SNQ2';

% Create SNQ2EditField
SNQ2EditField = uieditfield(  SNNoPanel, 'numeric');
SNQ2EditField.Position = [81 184 100 22];
SNQ2EditField.Value = SN.Q2;

% Create SNP2EditFieldLabel
SNP2EditFieldLabel = uilabel(  SNNoPanel);
SNP2EditFieldLabel.HorizontalAlignment = 'right';
SNP2EditFieldLabel.Position = [28 105 37 22];
SNP2EditFieldLabel.Text = 'SNP2';

% Create SNP2EditField
SNP2EditField = uieditfield(  SNNoPanel, 'numeric');
SNP2EditField.Position = [80 105 100 22];
SNP2EditField.Value = SN.P2;

% Create inPanel
inPanel = uipanel(  UIFigure);
inPanel.Title = 'in';
inPanel.FontWeight = 'bold';
inPanel.FontSize = 13;
inPanel.Position = [26 20 523 148];

% Create HLampLabel
HLampLabel = uilabel(  inPanel);
HLampLabel.HorizontalAlignment = 'center';
HLampLabel.FontSize = 30;
HLampLabel.FontWeight = 'bold';
HLampLabel.Position = [34 71 27 36];
HLampLabel.Text = 'H';

% Create HLamp
HLamp = uilamp(  inPanel);
HLamp.Position = [25 24 44 44];
HLamp.Color = [0.3294 0.5412 0.3294];

% Create VLampLabel
VLampLabel = uilabel(  inPanel);
VLampLabel.HorizontalAlignment = 'center';
VLampLabel.FontSize = 30;
VLampLabel.FontWeight = 'bold';
VLampLabel.Position = [119 71 26 36];
VLampLabel.Text = 'V';

% Create VLamp
VLamp = uilamp(  inPanel);
VLamp.Position = [109 24 44 44];
VLamp.Color = [0.3294 0.5412 0.3255];

% Create PLampLabel
PLampLabel = uilabel(  inPanel);
PLampLabel.HorizontalAlignment = 'center';
PLampLabel.FontSize = 30;
PLampLabel.FontWeight = 'bold';
PLampLabel.Position = [203 71 26 36];
PLampLabel.Text = 'P';

% Create PLamp
PLamp = uilamp(  inPanel);
PLamp.Position = [193 24 44 44];
PLamp.Color = [0.3294 0.5412 0.3255];

% Create MLampLabel
MLampLabel = uilabel(  inPanel);
MLampLabel.HorizontalAlignment = 'center';
MLampLabel.FontSize = 30;
MLampLabel.FontWeight = 'bold';
MLampLabel.Position = [285 71 30 36];
MLampLabel.Text = 'M';

% Create MLamp
MLamp = uilamp(  inPanel);
MLamp.Position = [277 24 44 44];
MLamp.Color = [0.3294 0.5412 0.3255];

% Create LLampLabel
LLampLabel = uilabel(  inPanel);
LLampLabel.HorizontalAlignment = 'center';
LLampLabel.FontSize = 30;
LLampLabel.FontWeight = 'bold';
LLampLabel.Position = [370 71 25 36];
LLampLabel.Text = 'L';

% Create LLamp
LLamp = uilamp(  inPanel);
LLamp.Position = [360 24 44 44];
LLamp.Color = [0.3294 0.5412 0.3255];

% Create RLampLabel
RLampLabel = uilabel(  inPanel);
RLampLabel.HorizontalAlignment = 'center';
RLampLabel.FontSize = 30;
RLampLabel.FontWeight = 'bold';
RLampLabel.Position = [452 71 27 36];
RLampLabel.Text = 'R';

% Create RLamp
RLamp = uilamp(  inPanel);
RLamp.Position = [443 24 44 44];
RLamp.Color = [0.3294 0.5412 0.3255];

%             % Create startButton
%               startButton = uibutton(  UIFigure, 'push', 'ButtonPushedFcn',@(startButton, event)...
%                   configAPT(startButton,UIAxes,SNP1EditField.Value,SNQ1EditField.Value,SNQ2EditField.Value,SNP2EditField.Value,...
%                   P1EditField.Value,Q1EditField.Value,Q2EditField.Value,P2EditField.Value))%%startButtonPushed(startButton,UIAxes));
%               %startButton.ButtonPushedFcn = createCallbackFcn(app, @startButtonPushed, true);
%               SN.P1 = SNP1EditField.Value; SN.Q1 = SNQ1EditField.Value; SN.Q2 = SNQ2EditField.Value; SN.P2 = SNP2EditField.Value;
%               ang.P1 = P1EditField.Value; ang.Q1 = Q1EditField.Value; ang.Q2 = Q2EditField.Value; ang.P2 = Q2EditField.Value;
%               writetable(SN,"SN0.csv"); writetable(ang,"ang.csv");
%               startButton.FontSize = 24;
%               startButton.FontWeight = 'bold';
%               startButton.Position = [174 694 159 39];
%               startButton.Text = 'start';

% Create outPanel
outPanel = uipanel(  UIFigure);
outPanel.Title = 'out';
outPanel.FontWeight = 'bold';
outPanel.FontSize = 13;
outPanel.Position = [601 20 523 148];

% Create HLamp_2Label
HLamp_2Label = uilabel(  outPanel);
HLamp_2Label.HorizontalAlignment = 'center';
HLamp_2Label.FontSize = 30;
HLamp_2Label.FontWeight = 'bold';
HLamp_2Label.Position = [34 71 27 36];
HLamp_2Label.Text = 'H';

% Create HLamp_2
HLamp_2 = uilamp(  outPanel);
HLamp_2.Position = [25 24 44 44];
HLamp_2.Color = [0.3294 0.5412 0.3255];

% Create VLamp_2Label
VLamp_2Label = uilabel(  outPanel);
VLamp_2Label.HorizontalAlignment = 'center';
VLamp_2Label.FontSize = 30;
VLamp_2Label.FontWeight = 'bold';
VLamp_2Label.Position = [119 71 26 36];
VLamp_2Label.Text = 'V';

% Create VLamp_2
VLamp_2 = uilamp(  outPanel);
VLamp_2.Position = [109 24 44 44];
VLamp_2.Color = [0.3294 0.5412 0.3255];

% Create PLamp_2Label
PLamp_2Label = uilabel(  outPanel);
PLamp_2Label.HorizontalAlignment = 'center';
PLamp_2Label.FontSize = 30;
PLamp_2Label.FontWeight = 'bold';
PLamp_2Label.Position = [203 71 26 36];
PLamp_2Label.Text = 'P';

% Create PLamp_2
PLamp_2 = uilamp(  outPanel);
PLamp_2.Position = [193 24 44 44];
PLamp_2.Color = [0.3294 0.5412 0.3255];

% Create MLamp_2Label
MLamp_2Label = uilabel(  outPanel);
MLamp_2Label.HorizontalAlignment = 'center';
MLamp_2Label.FontSize = 30;
MLamp_2Label.FontWeight = 'bold';
MLamp_2Label.Position = [285 71 30 36];
MLamp_2Label.Text = 'M';

% Create MLamp_2
MLamp_2 = uilamp(  outPanel);
MLamp_2.Position = [277 24 44 44];
MLamp_2.Color = [0.3294 0.5412 0.3255];

% Create LLamp_2Label
LLamp_2Label = uilabel(  outPanel);
LLamp_2Label.HorizontalAlignment = 'center';
LLamp_2Label.FontSize = 30;
LLamp_2Label.FontWeight = 'bold';
LLamp_2Label.Position = [370 71 25 36];
LLamp_2Label.Text = 'L';

% Create LLamp_2
LLamp_2 = uilamp(  outPanel);
LLamp_2.Position = [360 24 44 44];
LLamp_2.Color = [0.3294 0.5412 0.3255];

% Create RLamp_2Label
RLamp_2Label = uilabel(  outPanel);
RLamp_2Label.HorizontalAlignment = 'center';
RLamp_2Label.FontSize = 30;
RLamp_2Label.FontWeight = 'bold';
RLamp_2Label.Position = [452 71 27 36];
RLamp_2Label.Text = 'R';

% Create RLamp_2
RLamp_2 = uilamp(  outPanel);
RLamp_2.Position = [443 24 44 44];
RLamp_2.Color = [0.3294 0.5412 0.3255];

% Create andorPanel
andorPanel = uipanel( UIFigure);
andorPanel.Title = 'andor';
andorPanel.Position = [28 177 1096 67];

% Create timeEditFieldLabel
timeEditFieldLabel = uilabel( andorPanel);
timeEditFieldLabel.HorizontalAlignment = 'right';
timeEditFieldLabel.FontSize = 20;
timeEditFieldLabel.Position = [22 9 42 26];
timeEditFieldLabel.Text = 'time';

% Create timeEditField
timeEditField = uieditfield( andorPanel, 'numeric');
timeEditField.Position = [79 13 131 22];
timeEditField.Value = 0.2;

% Create onButton
onButton = uibutton(andorPanel, 'push', "ButtonPushedFcn", @(onButton, event) configAndorOnFig(onButton,timeEditField.Value));
onButton.FontSize = 20;
onButton.FontWeight = 'bold';
onButton.Position = [314 3 130 38];
onButton.Text = 'on';

% Create offButton
offButton = uibutton( andorPanel, 'push', "ButtonPushedFcn", @(offButton, event) configAndorOffFig);
offButton.FontSize = 20;
offButton.FontWeight = 'bold';
offButton.Position = [547 3 130 38];
offButton.Text = 'off';

% Create tempLabel
tempLabel = uilabel( andorPanel);
tempLabel.FontSize = 20;
tempLabel.Position = [780 9 49 26];
tempLabel.Text = 'temp';

% Create checkButton
checkButton = uibutton( andorPanel, 'push', "ButtonPushedFcn", @(checkButton, event) configAndorTempFig(checkButton,tempLabel));
checkButton.FontSize = 20;
checkButton.FontWeight = 'bold';
checkButton.Position = [932 3 130 38];
checkButton.Text = 'check';

% Create startButton
startButton = uibutton(UIFigure, 'push', 'ButtonPushedFcn',@(startButton, event)...
    configAPT(startButton,UIAxes,SNP1EditField.Value,SNQ1EditField.Value,SNQ2EditField.Value,SNP2EditField.Value,...
    P1EditField.Value,Q1EditField.Value,Q2EditField.Value,P2EditField.Value,timeEditField.Value,...
    HLamp,VLamp,PLamp,MLamp,LLamp,RLamp,HLamp_2,VLamp_2,PLamp_2,MLamp_2,LLamp_2,RLamp_2));%%startButtonPushed(startButton,UIAxes));
%startButton.ButtonPushedFcn = createCallbackFcn(app, @startButtonPushed, true);
SN.P1 = SNP1EditField.Value; SN.Q1 = SNQ1EditField.Value; SN.Q2 = SNQ2EditField.Value; SN.P2 = SNP2EditField.Value;
ang.P1 = P1EditField.Value; ang.Q1 = Q1EditField.Value; ang.Q2 = Q2EditField.Value; ang.P2 = Q2EditField.Value;
writetable(SN,"SN.csv"); writetable(ang,"angle.csv");
startButton.FontSize = 24;
startButton.FontWeight = 'bold';
startButton.Position = [174 694 159 39];
startButton.Text = 'start';

% Show the figure after all components are created
UIFigure.Visible = 'on';