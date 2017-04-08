program SimplePolitics2;
uses terminalUserInput;

const YEAR_TRUMP_ELECTED = 2016;

function calculateAgeWhenTrumpElected (birthYear: Integer): Integer;
var
	trumpAge : Integer;
begin
	trumpAge := YEAR_TRUMP_ELECTED - birthYear;
	result := trumpAge;
end;


function ReadBoolean (prompt: String): Boolean;
var
	booleanResult : Boolean;
begin
	if (prompt = 'y') then
		booleanResult := true
	else if (prompt = 'n') then
		booleanResult := false
	else
		writeLn('My buddy, my pal, you did not give a valid answer. Please try again.');

	result := booleanResult
end;


procedure Main();
var
	nom, prompt : String;
	trumpAge, yearBirth : Integer;
	brexitSupport : Boolean;
begin
	nom := ReadString ('Please enter your name: ');
	yearBirth := ReadInteger('What year were you born? ');

	trumpAge := calculateAgeWhenTrumpElected(yearBirth);
	
	WriteLn(nom, ', you were ', trumpAge, ' years old when Trump was elected');

	repeat
		prompt := ReadString ('Do you support Brexit, write Y/y for yes, or N/n for no: ');
		brexitSupport := ReadBoolean(prompt);
	until (prompt ='y') or (prompt ='n');

	if (brexitSupport) then
		writeLn (nom, ' is a Brexit supporter.')
	else
		writeLn (nom, ' is NOT a Brexit supporter.');

	WriteLn('Press Enter to Continue');
	ReadLn;
end;

begin
	Main();
end.

//TO DO: loop when not y/n. If y/n return true/false. Boolean var to track if y/n. 