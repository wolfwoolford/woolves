program MusicPlayWithObject;
uses SysUtils, SwinGame, terminaluserinput;

type
//Enumeration of Genre
    MusicGenre = (Blues, Rock, Indie, Jazz, Other);

   // myLibrary = class
    //private
     //   _album: Album;
    //public
      //  constructor CreateLib();

    //end;

    Album = class
    private
        _albumName: String;           //Album Name value
        _genre: MusicGenre;           //Album genre from the Enumeration
        _tracks: Integer;             //Value for number of tracks in the album
        _trackNames: array of String; //Array for each track name that will be dynamically assigned by the nunber of tracks
        _trackPath: array of String;  //Array for each track filepath that will be dynamically assigned by the number of tracks
    protected
        
    public
        constructor CreateAlbum();
        function ReadGenre(Prompt: String): MusicGenre;
        procedure PrintAlbum(const toPrint: album);
        
        //WHAT AM I DOINGghsdfjkafhlajkdjksahlkadljfjkal

    published
        
    end;