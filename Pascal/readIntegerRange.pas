program read_integer_range;
uses SysUtils;

function read_integer_range: boolean
var 
    ansLow, ansHigh, ans: Integer;
begin
    repeat
    result := true if
        (ans =< ansHigh) and (ans => ansLow);
    else 
        writeLn('This is not within the acceptable range. Please enter your answer again.');
    until result = true;
end;