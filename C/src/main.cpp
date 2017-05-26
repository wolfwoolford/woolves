#include <stdio.h>
#include "SwinGame.h"

int main()
{
    open_graphics_window("Circle Moving", 800, 600);
    float x = 400;
    float y = 300;
    int radius = 150;
    load_default_colors();
    do {
        process_events();
        if (key_down(LEFT_KEY) && ((x - radius) > 0)){
            x--;
        }
        
        if (key_down(RIGHT_KEY) && ((x + radius) < screen_width())) {
            x++;
        }
        if (key_down(UP_KEY) && ((y - radius) > 0)) {
            y--;
        }
        if (key_down(DOWN_KEY) && ((y + radius) < screen_height())){
            y++;
        }
        
        clear_screen(ColorWhite);
        fill_circle(COLOR_GREEN, x, y, radius);
        refresh_screen(60);
        
    }
    while (window_close_requested() != true);
    return 0;
}