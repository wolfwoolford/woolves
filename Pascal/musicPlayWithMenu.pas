program MusicPlayWithMenu;
uses SysUtils, TerminalUserInput;

type

//Enumeration of Genre
    MusicGenre = (Blues, Rock, Indie, Jazz, Other);

//album record initialised here
    Album = record  
        AlbumName: String;           //Album Name value
        Genre: MusicGenre;           //Album genre from the Enumeration
        Tracks: Integer;             //Value for number of tracks in the album
        TrackNames: array of String; //Array for each track name that will be dynamically assigned by the nunber of tracks
        TrackPath: array of String;  //Array for each track filepath that will be dynamically assigned by the number of tracks
    end;

    myLibrary = array of Album;

//Function to read in the album genre
function ReadGenre(prompt: String): MusicGenre;
var
    Gen: MusicGenre;
    val: Integer;
    num: Integer;
begin
    val := 0; //Initialising a default value for the music genre entered that is not an allowed value
    num := 1; //This number will be used to symbolise the 'number' of each genre when the user enters the genre value
    begin
        WriteLn('The possible genres are:');
        for Gen := Low(MusicGenre) to High(MusicGenre) do // list each genre
            begin
                WriteLn('Genre ', num, ': ', Gen);
                num += 1;
            end;
    end;


    begin
        val :=ReadIntegerRange(prompt, 1, 5);                   //psuedo is:
        case val of                                             //Write: What genre do u want (or whatever prompt)
            1 : begin                                           //ReadInt between 1 and length of genre enum
                    result := Blues;                            //I tried to make the max in the RIR = Length(MusicGenre) but it kept returning a type mismatch when I was trying to compile..
                end;                                            //case of int = equivalent music genre       
            2 : begin                                           //I wanted it to be MusicGenre[0] etc, but I couldn't figure out a way to assign ordinal values to an enum in a meaningful way'
                    result := Rock;
                end;                                            
            3 : begin 
                    result := Indie; 
                end;                                           
            4 : begin 
                    result := Jazz;
                end;
            5 : begin 
                    result := Other;
                end;
    end;
end;
end;

function ReadAlbum (): Album;
var
    i: Integer;
begin
    result.AlbumName := ReadString('What is the name of this album? ');
    result.Genre := ReadGenre('What is the genre of this album? ');

    result.Tracks := ReadIntegerRange('How many tracks are on this album?', 1, 15);     //ReadIntegerRange(prompt, min, max) is the format, in TUI.
    SetLength(result.Tracknames, result.Tracks);
    SetLength(result.TrackPath, result.Tracks);

    for i:= 0 to High(result.TrackNames) do                                                          //Unsure if it's best practise to do High(TrackNames) or Tracks-1 (as in an array it starts at 0 not 1)'
        begin
            WriteLn('Please enter the details for track ', i+1, ':');
            result.TrackNames[i] := ReadString('Enter the title for this track: ');
            result.TrackPath[i] := ReadString('Enter the filepath for this track: ');
        end;
    WriteLn();

end;

function PopulateLibrary(var array: myLibrary);
var
    i, LibSize: Integer;
begin
    LibSize := ReadInteger('How many albums are in your library? ');
    SetLength(myLibrary, LibSize);

    for i := 0 to High(myLibrary) do
        WriteLn('Please enter the details for album ', i+1, ':');
        myLibrary.[i] := ReadAlbum();
        WriteLn();
    end;

    WriteLn();
end;

procedure PrintLibrary(cont array: myLibrary);
begin
    for i := 0 to High(myLibrary) do
        WriteLn('The details for album ', i+1, ' are:');
        PrintAlbum(myLibrary[i]);
        WriteLn();
    end;

    WriteLn();
end;

procedure Menu();
var
    choice, exit: Integer;
    MyLib: myLibrary;
begin
    exit := 0;
    choice := 0;
    repeat
        begin
            WriteLn('The following menu option are available: ');
            WriteLn('1. Read in Albums');
            WriteLn('2. Display Albums');
            WriteLn('3. Select an Album to play');
            WriteLn('4. Update an existing Album');
            WriteLn('5. Exit the application');

            Choice := ReadIntegerRange('What would you like to do? ', 1, 5);
            case Choice of
            1 : begin
                    PopulateLibrary(MyLib);
                end;
            2 : begin
                    if MyLib <> null then
                       PrintLibrary(MyLib);
                    else
                        WriteLn('Your library is empty.');
                end;                                            
            3 : begin 
                   if MyLib <> null then
                       PrintLibrary(MyLib);
                    else
                        WriteLn('Your library is empty.');
                end;                                           
            4 : begin 
                    if MyLib <> null then
                       PrintLibrary(MyLib);
                    else
                        WriteLn('Your library is empty.');
                end;
            5 : begin 
                    WriteLn('Are you sure you want to exit?');
                    WriteLn('1 = Yes, it is my time to depart the sacred land of text-based music players...');
                    WriteLn('2 = No, i"ll never leave you, light of my life, fire of my soul, text-based-music-player....')
                    exit := ReadIntegerRange('', 1, 2);
                    if exit = 1 then
                        WriteLn('I"ll always think about the time we spent together....');
                    else 
                        WriteLn('Thank gosh.... it gets so lonely here...');
                end;
            end;
        
    until (exit = 1);
end;


procedure PrintAlbum (toPrint : Album);
var
    i: Integer;
begin
    WriteLn();
    WriteLn('You album details: ');
    WriteLn('Album name: ', toPrint.AlbumName);
    WriteLn('Album genre: ', toPrint.Genre);
    for i := 0 to High(toPrint.TrackNames) do
        begin
            WriteLn('Track ', i+1, ' is titled: ', toPrint.Tracknames[i]);
            Write(' and has the filepath: ', toPrint.TrackPath[i]);
        end;
    WriteLn();
end;

procedure Main();
var
    MyAlbum: Album;
begin
   MyAlbum := ReadAlbum();
   PrintAlbum(MyAlbum);
   WriteLn('Press enter to exit...');
   ReadLn();
end;

begin
    Main();
end.