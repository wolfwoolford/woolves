program nameTester;
uses terminalUserInput;


procedure outputSillyName(yourName : String);
var
	i : Integer;

begin
	i := 0;
	Write (yourName, 'is a ');
	while (i<60) do
	begin
		Write ('silly ');
		i := i+1;
	end;
	Write('name!');
end;

procedure main();
var
	yourName : string;

begin
	yourName := readString('Please enter your name: ');

if yourName = 'Perrin' then
	WriteLn ('Awesome name!')
else
	outputSillyName(yourName);
end;


begin
	main();
end.