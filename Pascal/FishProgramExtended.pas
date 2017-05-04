uses TerminalUserInput;

type
  FishSpecies = (Goldfish, Baramundi, Tuna);

  FishData = record
    name: String;
    species: FishSpecies;
    length: Double;
  end;

  FishArray = array of FishData;

function ReadFishSpecies(): FishSpecies;
var
  res: Integer;
begin
  WriteLn('1 - Goldfish');
  WriteLn('2 - Baramundi');
  WriteLn('3 - Tuna');

  // User could enter out of the range of values.
  // If we had ReadIntegerRange but at the moment this is not validated!
 res := ReadInteger('Please enter your choice: ');
 if (res > 3) or (res < 1) then
 repeat
    WriteLn('This is not a valid answer.');
    res := ReadInteger('Please enter your choice: ');
 until (res < 4) and (res > 0);
  
  result := FishSpecies(res - 1);
end;

function ReadFishData(): FishData;
begin
  result.name := ReadString('Enter the fish name: ');
  result.species := ReadFishSpecies();
  result.length := ReadDouble('Enter the length of the fish: ');
end;

procedure PrintFishData(toPrint: FishData);
begin
  WriteLn(toPrint.name);
  WriteLn(toPrint.species);
  WriteLn(toPrint.length:0:2, 'mm');
  WriteLn('');
end;

procedure Main();
var
  i: Integer;
  fishCount: Integer;
  fish: FishArray;
begin
  fishCount := ReadInteger('How many fish would you like to store? ');
  SetLength(fish, fishCount);

  for i := 0 to High(fish) do
  begin
    fish[i] := ReadFishData();
  end;

  WriteLn('');
  WriteLn('All fish are entered, now will print...');
  WriteLn('');

  for i := 0 to High(fish) do
  begin
    PrintFishData(fish[i]);
  end;

end;

begin
  Main();
end.
