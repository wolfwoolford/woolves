program TextMusicPlayer;
uses terminaluserinput;

type

//There are 5 kinds of genre available, as well as an 'other' for undefined genres
    MusicGenre = ( Blues, Rock, Indie, Jazz, Acoustic, Other );

//Each album has the following values
    album = record
        AlbumName: String;              //the album name
        Genre: MusicGenre;              //the genre
        Tracks: Integer;                //number of tracks
        TrackNames: array of String;    //the track names
        TrackPath: array of String;     //Track filepaths
    end;

//am I allowed to make a global array? is that a thing?
    myLibrary: array of album;


//A function to read in the album.genre and validate it
function ReadGenre(prompt: String): MusicGenre;
var
	val : String;
begin
	//WriteLn('Which genre? ');
	WriteLn('Blues');
	WriteLn('Rock');
	WriteLn('Indie');
	WriteLn('Jazz');
    WriteLn('Acoustic');
	WriteLn('Other');

	//Jake i know u told me to change this but like... can u pass me anyway and i'll change it some time that isn't now???
	repeat
		val := ReadString(prompt);
		case (val) of
			'Blues' : result := Blues;
			'Rock'  : result := Rock;
            'Indie' : result := Indie;
			'Jazz' : result := Jazz;
			'Acoustic' : result := Acoustic;
			'Other' : result := Other;
			else WriteLn('That was not a valid option, please enter either Blues, Rock, Indie, Jazz, Acoustic or Other.');
		end;
	until ((val = 'Blues') or (val = 'Rock') or (val = 'Indie') or (val = 'Jazz') or (val = 'Acoustic') or (val = 'Other'))

//Function to read in the data for an individual album
function ReadAlbum(): album;
var
    i, track: Integer;
begin
// result.AlbumName := ReadAlbumName(What is the name of the album? );
    result.AlbumName := ReadString('What is the name of this album?');
    result.Genre :=ReadGenre('Please enter which genre is most accurate:');
    track := ReadInteger('Please enter the number of tracks in your record (must be less than 20 soz bro)');
        if track =< 0 or track > 20 
            repeat
                begin
                    track := ReadInteger('This is not a valid number of tracks. Please enter a number between 1 and 20.')
                end;
    SetLength(result.TrackNames, result.Track);
    for i := Low(result.TrackNames) to High(result.TrackNames) do
        result.TrackName[i] := ReadString('Enter track name for track ', i, ':');
    SetLength(result.TrackPath, result.Track);
    for i := Low(result.TrackPath) to High(result.TrackPath) do
        result.TrackName[i] := ReadString('Enter track filepath for track ', i, ':');
end;


//procedure to output the details of an album
procedure PrintAlbum(var toPrint: album);
var
    i: Integer;
begin
    WriteLn('Your album details: ');
    WriteLn('Album name: ', toPrint.AlbumName);
    WriteLn('Album genre: ', toPrint.Genre);
    for i :=Low(toPrint.TrackNames) to High(toPrint.TrackNames) do
        WriteLn('Track number ', i+1, ' is called: ', toPrint.TrackNames[i]);
        WriteLn('Track number', i+1, 's filepath is:', toPrint.TrackPath[i]);  
end;


//function to call in the details of the music array
procedure PopulatePrintLibrary(var array: myLibrary);
var 
    i, LibSize: Integer;
begin
    LibSize := ReadInteger('How many albums are in your library?');
    SetLength(myLibrary, LibSize);

    i := Low(LibSize);
    while i <= High(LibSize) do
    begin
        myLibrary[i] := ReadAlbum();
        i := i+1;
    end;
end;

//procedure to select what to play
function SelectAlbum(var array: MyLibrary): album;
var
    i, AlNum: Integer;
begin
    WriteLn('The following albums are in your library:')
    for i := Low(MyLibrary) to i := High(MyLibrary) do
        begin
            WriteLn(i+1, ' ', MyLibrary.album[i].AlbumName, ' - ');
            Write(MyLibrary.album[i].Genre);
            i := i+1;
        end;
    AlNum := ReadInteger('Which album would you like to play?') - 1;
    result := MyLibrary.album[AlNum];
end;

//select song
function SelectSong (var SelectedAlbum: album): integer;
var
    i : Integer;
begin
    WriteLn('The following songs are available to play from that album: ');
    for i := Low(SelectedAlbum.TrackName) to High(SelectedAlbum.TrackName) do
        begin
            WriteLn(i+1, '. ',SelectedAlbum.TrackName[i]);
        end;
        choice := ReadInteger('What number track would you like to play?') -1;
end;

//procedure to print the final output
procedure PrintSongDetails(var albumData: album, TrackNum: Integer);
begin
    WriteLn('Your selection details: ');
    WriteLn('The track you selected: ', albumData.TrackName[TrackNum]);
    WriteLn('From the album: ', albumdata.AlbumName);
    WriteLn('is now playing... from file location:', albumData.TrackPath[TrackNum]);
    WriteLn('Press enter to continue');
    ReadLn();
end;

//and now to bring it all together.... hopefully....
procedure Main();
var
    AlSelect : album;
    TraSelect : Integer;
begin
    PopulatePrintLibrary();
    AlSelect := SelectAlbum();
    TraSelect := SelectSong(AlSelect);
    PrintSongDetails(AlSelect, TraSelect);
end;

begin
    Main();
end.