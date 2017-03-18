unit ValidateString;

//adpated from password validation procedure found at http://stackoverflow.com/questions/39797416/turbo-pascal-check-if-string-contains-numbers

interface

function ValStringNoInt (prompt: String): String;
//Displays a prompt to the user
//Reads the string in that they reply with
//Validates that the string is not empty, and does not contain numbers

implementation

function ValStringNoInt(prompt: String): String;
var
	Error, i: Integer;
	str: String;
const
	NoError = 0;
	StrIsBlank = 1;
	StrIsDigit = 2;
begin
	repeat
		Error := NoError;
		Write(prompt);
		ReadLn(str);

		if Length(str) = 0 then
			Error := StrIsBlank;

		if Error = NoError then begin
			for i :=1 to Length(str) do begin
				if (Str[i]) in ['0'..'9'] then begin
					Error := StrIsDigit;
					Break;
				end;
			end;
		end;
	case (Error) of
		StrIsBlank : WriteLn('This field cannot be blank, please try again.');
		StrisDigit : WriteLn('This field cannot contain numbers, please try again.');
	end;
	until (Error = NoError);
	result := str
end;

end.