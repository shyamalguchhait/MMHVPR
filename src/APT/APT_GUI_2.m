clear; close all; clc;
global h1 h2; % make h a global variable so it can be used outside the main
          % function. Useful when you do event handling and sequential           move
%% Create Matlab Figure Container
fpos    = get(0,'DefaultFigurePosition'); % figure default position
fpos(3) = 650; % figure window size;Width
fpos(4) = 450; % Height
 
f1 = figure('Position', fpos,...
           'Menu','None',...
           'Name','APT GUI');
f2 = figure('Position', fpos,...
           'Menu','None',...
           'Name','APT GUI');
%% Create ActiveX Controller
h1 = actxcontrol('MGMOTOR.MGMotorCtrl.1',[20 20 600 400 ], f1);
h2 = actxcontrol('MGMOTOR.MGMotorCtrl.1',[20 20 600 400 ], f2);
%% Initialize
% Start Control
h1.StartCtrl;
h2.StartCtrl;
% Set the Serial Number
SN1 = 27260131; % put in the serial number of the hardware
SN2 = 27260140;
set(h1,'HWSerialNum', SN1);
set(h2,'HWSerialNum', SN2);
% Indentify the device
h1.Identify;
h2.Identify;
 
pause(5); % waiting for the GUI to load up;
%% Controlling the Hardware
%h.MoveHome(0,0); % Home the stage. First 0 is the channel ID (channel 1)
                 % second 0 is to move immediately
%% Event Handling
h1.registerevent({'MoveComplete' 'MoveCompleteHandler'});
h2.registerevent({'MoveComplete' 'MoveCompleteHandler'});
%% Sending Moving Commands
timeout = 10; % timeout for waiting the move to be completed
%h.MoveJog(0,1); % Jog
 
% Move a absolute distance
h1.SetAbsMovePos(0,7);
h1.MoveAbsolute(0,1==0);
s1 = h1.GetStatusBits_Bits(0);
if IsMovingCustom(s1) == false
    h2.SetAbsMovePos(0,7);
    h2.MoveAbsolute(0,1==0);
end
t1 = clock; % current time
while(etime(clock,t1)<timeout) 
% wait while the motor is active; timeout to avoid dead loop
    s1 = h1.GetStatusBits_Bits(0);
    s2 = h2.GetStatusBits_Bits(0);
    if IsMoving(s1) && IsMoving(s2)
      pause(2); % pause 2 seconds;
      h1.MoveHome(0,0);
      h2.MoveHome(0,0);
      disp('Home Started!');
      break;
    end
end
