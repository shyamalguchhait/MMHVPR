function r = IsMovingCustom(StatusBits)
% Read StatusBits returned by GetStatusBits_Bits method and determine if
% the motor shaft is moving; Return 1 if moving, return 0 if stationary
s = abs(StatusBits/10^9);
if (1.4-s)>=0
    r = true;
else
    r = false;
end