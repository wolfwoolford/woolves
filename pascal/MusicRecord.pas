program MusicRecords;
{uses TerminalUserInput;}

type
	Genre = (Blues, Indie, Trap, Beyonce);
	Music = Record
		Artist: String;
		Gen: Genre;
		Folder: String;
		Year: Integer;
	end;

function ReadGenre(prompt: String): String;
var
	val: String;
begin
	WriteLn('What Genre?');
	WriteLn('Blues');
	WriteLn('Indie');
	WriteLn('Trap');
	WriteLn('Beyonce');
	{do val := ReadString('Please enter the genre of this record.');}
    val := '';
    repeat
        {val := ReadString('Please enter the genre of this record.');}
        val := 'Blues';
	until (val = 'Blues') or (val = 'Indie') or ( val = 'Trap') or ( val = 'Beyonce');

	ReadGenre := val
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
