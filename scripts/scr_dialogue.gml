//scr_dialogue("Text",x,y):
if(object_exists(obj_textbox))
    {
        var textbox  = instance_place(x-260, y-130, obj_textbox);
        if textbox != noone
        {   show_debug_message("exists")
        
            with(textbox) instance_destroy();
        }
    }

txt = instance_create(argument1,argument2,obj_textbox);
with (txt)
{
    //draw_set_halign(fa_left)
    draw_set_valign(fa_top)

    message = argument0;
    /*font = fnt;
    text_length = string_length(message);
    font_size = font_get_size(font);
    draw_set_font(font);*/
}
