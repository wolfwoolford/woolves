#include <stdio.h>
#include <string.h>
#include "terminal_user_input.h"

typedef enum {Blues, Rock, Indie, Jazz, Other} MusicGenre;

struct album {
    my_string album_name;
    MusicGenre album_genre;
    int tracks;
    my_string track_names[15];
    my_string track_paths[15];
};

int read_genre(char* prompt) {
    int val;
    MusicGenre Gen; 
    int i =0;
   
    printf("The following genres are available:\n");
    printf("1. Blues\n");
    printf("2. Rock\n");
    printf("3. Indie\n");
    printf("4. Jazz\n");
    printf("5. Other\n");

    do {
        val = read_integer_range(prompt,1,5);
        switch (val){
        case 1: 
            Gen = Blues;
        break;
        case 2: 
            Gen = Rock;
        break;
        case 3: 
            Gen = Indie;
        break;
        case 4: 
            Gen = Jazz;
        break;
        case 5: 
            Gen = Other;
        break;
        } 
    }
    while (Gen == 0);
    return Gen;
}

int read_album(struct album myAlbum) {
    int i = 0;
    int length;
    myAlbum.album_name = read_string("What is the name of your album? ");
    myAlbum.album_genre = read_genre("What genre is your album?");
    myAlbum.tracks = read_integer_range("How many tracks are in your album?",1,15);
    length = myAlbum.tracks;
    for (i=0;i<length;i++) {
        printf("For track number %d", i+1);
        myAlbum.track_names[i] = read_string("\nWhat is the name of this track? ");
        myAlbum.track_paths[i] = read_string("What is the filepath of track? ");
    }
}

int print_album(album toPrint){
    int i;
    int choice;
    int length = toPrint.tracks;
    printf("The following songs are available to play: \n");
    for (i=0;i<length;i++)
    printf("Track %d.", (i+1)," %s\n", toPrint.track_names[i]);
    choice = read_integer_range("Which song would you like to play?", 1, length);
    return choice;
}

int print_song_details(struct album toPrint, int choice){
    printf("Your selection details: \n");
    printf("The track you selected: %s\n", toPrint.track_names[choice]);
    printf("From the album %s\n", toPrint.album_name);
    printf("is now playing... from the file location: %s\n", toPrint.track_paths[choice]);
    return 0;
}

int main(){
    struct album myAlbum;
    int TrackSelect;

    read_album(myAlbum);
    TrackSelect = print_album(myAlbum);
    print_song_details(myAlbum, TrackSelect);
}
   

