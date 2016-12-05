//scr_dialogue("Text",x,y):
if(object_exists(obj_textbox))
    {
        var textbox  = instance_place(x-200, y-100, obj_textbox);
        if textbox != noone
        {   
            with(textbox) instance_destroy();
        }
    }

txt = instance_create(argument1,argument2,obj_textbox);
with (txt)
{
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)

    message = argument0;
}
