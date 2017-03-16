program ReadWrite2;

procedure PopulateLine(var PopLine: array of String; var N: Integer);
var
	myFile: TextFile;
	i: Integer;
begin
	AssignFile(myFile, 'mytestfile2.dat');
	Reset(myFile);
	ReadLn(myFile, N);
	
	for i:=0 to N do
		ReadLn(myFile, PopLine[i]);

	Close(myFile);
end;

procedure PrintLine(const PrintLine: array of String; var N: Integer);
var
	p: Integer;
begin
	WriteLn('The file contained:');
	for p:=0 to N do
		WriteLn(PrintLine[p]);
end;

procedure Main();
var
	N: Integer;
	Line: array [0..20] of String;
	myFile: TextFile;
begin
	AssignFile(myFile, 'mytestfile2.dat');
	Reset(myFile);
	ReadLn(myFile, N);
	Close(myFile);
	PopulateLine(Line, N);
	PrintLine(Line, N);
	WriteLn('Press enter to continue...');
	ReadLn();
end;

begin
	Main();
end.