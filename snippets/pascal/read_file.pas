program ReadFile;
 
uses
 Sysutils;
 
const
  C_FNAME = 'read_file.txt';
 
var
  tfIn: TextFile;
  s: string;
 
begin
  // Give some feedback
  writeln('Reading the contents of file: ', C_FNAME);
  writeln('=========================================');
 
  // Set the name of the file that will be read
  AssignFile(tfIn, C_FNAME);
 
  // Embed the file handling in a try/except block to handle errors gracefully
  try
    // Open the file for reading
    reset(tfIn);
 
    // Keep reading lines until the end of the file is reached
    while not eof(tfIn) do
    begin
      readln(tfIn, s);
      writeln(s);
    end;
 
    // Done so close the file
    CloseFile(tfIn);
 
  except
    on E: EInOutError do
     writeln('File handling error occurred. Details: ', E.Message);
  end;
 
  // Wait for the user to end the program
  writeln('=========================================');
  writeln('File ', C_FNAME, ' was probably read. Press enter to stop.');
  readln;
end.
