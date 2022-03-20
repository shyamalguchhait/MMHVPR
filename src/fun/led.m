function  led(in,out,i,j,HLamp,VLamp,PLamp,MLamp,LLamp,RLamp,HLamp_2,VLamp_2,PLamp_2,MLamp_2,LLamp_2,RLamp_2)
    lIn = in + "Lamp.Color";
    lOut = out + "Lamp_2.Color";%[0.3294 0.5412 0.3255]
    eval([char(lIn(i)) '= "g";']);
    eval([char(lOut(j)) '= "g";']);
    for ii = 1:6
        if ii ~= i
             eval([char(lIn(ii)) '= [0.3294 0.5412 0.3255];']);
        end
        if ii ~= j
             eval([char(lOut(ii)) '= [0.3294 0.5412 0.3255];']);
        end
    end
end
