program MusicPlayWithMenu;
uses SysUtils, TerminalUserInput;

type

//Enumeration of Genre
    MusicGenre = (Blues, Rock, Indie, Jazz, Other);

//album record initialised here
    album = record  
        AlbumName: String;           //Album Name value
        Genre: MusicGenre;           //Album genre from the Enumeration
        Tracks: Integer;             //Value for number of tracks in the album
        TrackNames: array of String; //Array for each track name that will be dynamically assigned by the nunber of tracks
        TrackPath: array of String;  //Array for each track filepath that will be dynamically assigned by the number of tracks
    end;

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
                    result := Blues;                    //I tried to make the max in the RIR = Length(MusicGenre) but it kept returning a type mismatch when I was trying to compile..
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


procedure Main();
var
    MyAlbum: album;
begin
    MyAlbum.AlbumName := ReadString('What is the name of this album? ');
    MyAlbum.Genre := ReadGenre('What number genre is this album? ');
    WriteLn('The album name is ', MyAlbum.AlbumName, ' and the album genre is ', MyAlbum.Genre);
end;

begin
    Main();
end.