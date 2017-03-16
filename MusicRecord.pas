program MusicRecords;
uses TerminalUserInput;

type
	Genre = (Blues, Indie, Trap, Beyonce);
	Music = Record
		Artist: String;
		Gen: Genre;
		Folder: String;
		Year: Integer;
	end;

function ReadGenre(prompt: String): Genre;
var
	val: Integer;

begin
	WriteLn('What Genre?');
	WriteLn('Blues');
	WriteLn('Indie');
	WriteLn('Trap');
	WriteLn('Beyonce');
	if ((val not = 'Blues') or (val not = 'Indie') or (val not = 'Trap') or (val not = 'Beyonce')) do
		ReadString('Please enter the genre of this record.')
	end;
	result := Genre;
end;

function ReadRecord(prompt: String): Music;
begin
	rec.Artist := ReadString('Please enter the record Artists Name: ');
	rec.Genre := ReadGenre;
	rec.Folder := ReadString('Please enter the record filepath: ');
	rec.Year := ReadInteger('Please enter the year this record was made: ');
end;

Procedure PrintMusic(const toPrint: Music);
begin
	WriteLn('Record details: ');
	WriteLn('Artist: ', toPrint.Artist);
	WriteLn('Genre: ', toPrint.Genre);
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