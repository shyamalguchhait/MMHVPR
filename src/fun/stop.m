function stop
    closereq;
    configAndorOff;
    for i = 1:length(h)
        s(i) = h(i).GetStatusBits_Bits(0);
    end
    pause(5);
    for i = 1:lenght(h)
        h(i).MoveHome(0,0);
        disp("Home Started");
    end
end