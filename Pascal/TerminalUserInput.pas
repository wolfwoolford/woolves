unit TerminalUserInput;

interface

///
/// Displays a prompt to the user, and reads in the string
/// they reply with. The string entered is then returned.
///
function ReadString(prompt: String): String;

///
/// Displays a prompt to the user, and reads in the number (whole)
/// they reply with. The function ensures that the user's entry
/// is a valid Integer. The Integer entered is then returned.
///
function ReadInteger(prompt: String): Integer;

///
/// Displays a prompt to the user, and reads in the number (real)
/// they reply with. The function ensures that the user's entry
/// is a valid Double. The Double entered is then returned.
///
function ReadDouble(prompt: String): Double;


implementation
uses SysUtils;

function ReadString(prompt: String): String;
begin
	Write(prompt);
	ReadLn(result);
end;

function ReadInteger(prompt: String): Integer;
var
	line: String;
begin
	line := ReadString(prompt);
	while not TryStrToInt(line, result) do
	begin
		WriteLn(line, ' is not an integer.');
		line := ReadString(prompt);
	end;
end;

function ReadDouble(prompt: String): Double;
var
	line: String;
begin
	line := ReadString(prompt);
	while not TryStrToFloat(line, result) do
	begin
		WriteLn(line, ' is not a double.');
		line := ReadString(prompt);
	end;
end;

//this isn't quite right, but it's what I got for now and I'll work on it later....
//function read_integer_range (prompt: String; ansLow, ansHigh: integer): boolean
//var
//  line: String;
//begin
  //  result := false;
    //line := ReadString(prompt);
    //while not TryStrToInt(line) do
	//begin
      //  result := false;
      //  WriteLn(line, ' is not an integer.');
	//end;
    //repeat
        //result := true if
        //(ans =< ansHigh) and (ans => ansLow);
    //else 
        //writeLn('This is not within the acceptable range. Please enter your answer again.');
    //until result = true;
//end;

end.