program ReadWrite2;

procedure PopulateLine(var PopLine: array of String; var N: Integer);
var
	myFile: TextFile;
	i: Integer;
	begin
	AssignFile(myFile, 'mytestfile2.dat');
	Reset(myFile);
		for i:=0 to N do
		PopLine[i] := ReadLn (myFile, ___FJADKL?!);
		end;
	end;

procedure PrintLine(const PrintLine : array of String; var N: Integer);
var
	p: Integer;
	begin
	WriteLn('The file contained:')
		for p:=0 to N do
		WriteLn(PrintLine[p]);
		end;
	end;

procedure Main();
var
	N: Integer;
	Line: array [0..N] of String;
	myFile: TextFile;
	begin
	AssignFile(myFile, 'mytestfile2.dat');
	Reset(myFile)
	ReadLn(myFile, N)
	PopulateLine(Line, N);
	PrintLine(Line, N)
	WriteLn;
	WriteLn('Press enter to continue...')
	ReadLn();
	end;

begin
Main();
end.