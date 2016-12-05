///scr_randomMovements(amount,view)

if(random(1000)>990&&!Move&&!isOut&&!Busy&&!isSelected&&!isTarget){
    
    if(object_exists(obj_textbox))
    {
        var textbox  = instance_place(x-260, y-130, obj_textbox);
        if textbox != noone
        {  
            with(textbox) instance_destroy();
        }
    }
    MoveX=floor(random(100))-50+x;
    if(MoveX<=368)
        MoveX = 368;
    else if(MoveX>=1552)
        MoveX = 1552;
    Move=true;
    MoveSpeed = 7;
}
