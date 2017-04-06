program MusicRecords;
uses TerminalUserInput;

type
	Genre = (Blues, Indie, Trap, Beyonce, Other);
	Music = Record
		Artist: String;
		Gen: Genre;
		Folder: String;
		Year: Integer;
	end;

function ReadGenre(prompt: String): Genre;
var
	val : String;
	
begin
	WriteLn('Which genre? ');
	WriteLn('Blues');
	WriteLn('Indie');
	WriteLn('Trap');
	WriteLn('Beyonce');
	WriteLn('Other');

	//I'm not sure if this is the simplest way to do this or not??
	repeat
		val := ReadString('Which genre? ');
		case (val) of
			'Blues' : result := Blues;
			'Indie' : result := Indie;
			'Trap' : result := Trap;
			'Beyonce' : result := Beyonce;
			'Other' : result := Other;
			else WriteLn('That was not a valid option, please enter either Blues, Indie, Trap, Beyonce or Other.');
		end;
	until ((val = 'Blues') or (val = 'Indie') or (val = 'Trap') or (val = 'Beyonce') or (val = 'Other'))
	

end;

function ReadRecord(val: String): Music;
begin
	result.Artist := ReadString('Please enter the record Artists Name: ');
	WriteLn();
	result.Gen := ReadGenre('Please enter which genre is most accurate: ');
	WriteLn();
	result.Folder := ReadString('Please enter the record filepath: ');
	WriteLn();
	result.Year := ReadInteger('Please enter the year this record was made: ');
	WriteLn();
end;

Procedure PrintMusic(const toPrint: Music);
begin
	WriteLn('Your record details: ');
	WriteLn('Artist: ', toPrint.Artist);
	WriteLn('Genre: ', toPrint.Gen);
	WriteLn('File path: ', toPrint.Folder);
	WriteLn('Year released: ', toPrint.Year)
end;

Procedure Main();
var	
	rec : Music;
begin
	rec := ReadRecord('Please enter the details about this record..');
	PrintMusic(Rec);
end;

begin
	Main();
end.