function configAPT(startButton,UIAxes,SNP1,SNQ1,SNQ2,SNP2,P1,Q1,Q2,P2,timeEditField, ...
    HLamp,VLamp,PLamp,MLamp,LLamp,RLamp,HLamp_2,VLamp_2,PLamp_2,MLamp_2,LLamp_2,RLamp_2)
%%
path = uigetdir();
index = "1";
pathSave = fullfile(path,index);
mkdir(pathSave);
global h;
fpos = [10,10,650,450];
f = figure("Position",fpos,"Menu","None","Name","MM automation");
h = actxcontrol("MGMOTOR.MGMOTORCtrl.1",[25,225,300,200],f); %P1
h(2) = actxcontrol("MGMOTOR.MGMOTORCtrl.1",[325,225,300,200],f); %Q1
h(3) = actxcontrol("MGMOTOR.MGMOTORCtrl.1",[25,25,300,200],f); % Q2
h(4) = actxcontrol("MGMOTOR.MGMOTORCtrl.1",[325,25,300,200],f); %P2

SN = [SNP1, SNQ1, SNQ2, SNP2];
for i = 1:length(h)
    h(i).StartCtrl;
    set(h(i), "HWSerialNum", SN(i));
    h(i).Identify;
    pause(5);
    h(i).registerevent({'MoveComplete','MoveCompleteHandler'});
end
APg = [0,0,0,45,90,135];
AQg = [0,45,135,45,90,135];
APa = [0,45,90,90,90,135];
AQa = [0,45,45,90,135,135];
%% actual angle
AP1 = []; AQ1 = []; AP2 = []; AQ2 = [];
for i = APs
    if i+P1 <360
        AP1 = [AP1, i+P1];
    else
        AP1 = [AP1, i+P1-360];
    end
end
for i = AQs
    if i+Q1 <360
        AQ1 = [AQ1, i+Q1];
    else
        AQ1 = [AQ1, i+Q1-360];
    end
end
for i = APs
    if i+P2 <360
        AP2 = [AP2, i+P2];
    else
        AP2 = [AP2, i+P2-360];
    end
end
for i = AQs
    if i+Q2 <360
        AQ2 = [AQ2, i+Q2];
    else
        AQ2 = [AQ2, i+Q2-360];
    end
end
%%
in = ["H","L","R","P","V","M"];
out = ["H","P","L","V","R","M"];
%% Camera
%configAndor(timeEditField.Value);
for i = 1:length(APg)
    h(1).SetAbsMovePos(0,APg(i)+P1); h(1).MoveAbsolute(0,1==0);
    h(2).SetAbsMovePos(0,AQg(i)+Q1); h(2).MoveAbsolute(0,1==0);
    pause(10);
    for j = 1:length(APa)
        h(3).SetAbsMovePos(0,AQa(j)+Q2); h(3).MoveAbsolute(0,1==0);
        h(4).SetAbsMovePos(0,APa(j)+P2); h(4).MoveAbsolute(0,1==0);
        pause(20);
        % led
        led(in,out,i,j,HLamp,VLamp,PLamp,MLamp,LLamp,RLamp,HLamp_2,VLamp_2,PLamp_2,MLamp_2,LLamp_2,RLamp_2);
        %% Image
        pause(5);
        name = strcat(in(i),out(j));
        imageAcquisition(UIAxes,pathSave,name); 
    end
end
pause(10);
configAndorOff;
timeout = 10;
t = clock;
while(etime(clock,t)<timeout)
    for i = 1:length(h)
        s(i) = h(i).GetStatusBits_Bits(0);
    end
    if ~(IsMovingCustom(s(1)) && IsMovingCustom(s(2)) && IsMovingCustom(s(3)) && IsMovingCustom(s(4)))
        pause(5);
        for i = 1:lenght(h)
            h(i).MoveHome(0,0);
            disp("Home Started");
        end
        break;
    end
end