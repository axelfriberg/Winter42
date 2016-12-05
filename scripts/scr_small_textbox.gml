///scr_small_textbox("Text",x,y):
if(object_exists(obj_smallTextbox))
    {
        var textbox  = instance_place(x+60, y-30, obj_smallTextbox);
        if textbox != noone
        {   
            with(textbox) instance_destroy();
        }
    }

txt = instance_create(argument1,argument2,obj_smallTextbox);
with (txt)
{
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)

    message = argument0;
}
