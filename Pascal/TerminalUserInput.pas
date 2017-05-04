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

///
/// Displays a promp to the user, and reads in the number (whole)
/// they reply with. The function ensures that the user's entry
/// is between a range of two Integers. The Integer is then returned.
///
function ReadIntegerRange(prompt: String; min: Integer; max: Integer): Integer;


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

function ReadIntegerRange(prompt: String; min: Integer; max: Integer): Integer;
var
	input: Integer;
begin
	input := ReadInteger(prompt);
	while (input < min) do
		begin
			WriteLn(input, ' is less than the accepted minimum. Please enter a number between ', min, ' and ', max, '.');
			input := ReadInteger(prompt);
		end;
	while (input > max) do
		begin
			WriteLn(input, ' is greater than the accepted maximum. Please enter a number between ', min, ' and ', max, '.');
			input := ReadInteger(prompt);
		end;
	
	result := input;
end;

end.