//scr_pause()
//should pause the game
width = surface_get_width(application_surface);
height = surface_get_height(application_surface);

global.pauseScreenshot = background_create_from_surface(application_surface, 0, 0, width, height, false, false);
//screen_save(working_directory + "PauseScreen.png");

instance_deactivate_all(self);


background_index[0] = global.pauseScreenshot;
background_xscale[0] = 1.5;
background_yscale[0] = 1.5;

room_set_background(room,1,1,0,global.pauseScreenshot,room_width/2,room_height/2,0,0,0,0,1);

