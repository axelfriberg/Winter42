///scr_randomMovements(amount,view)

if(random(1000)>990&&!Move&&!isOut&&!Busy&&!isSelected){
    
    if(object_exists(obj_textbox))
    {
        var textbox  = instance_place(x-260, y-130, obj_textbox);
        if textbox != noone
        {   show_debug_message("exists")
        
            with(textbox) instance_destroy();
        }
    }
    
    MoveX=floor(random(1184))+368;
    var fl = random(4);
    switch(floor(fl)){
    case 0:MoveY=928;
           break;
    case 1:MoveY=736;
           break;
    case 2:MoveY=544;
           break;
    case 3:MoveY=352;
           break;
    }
    Move=true;
    MoveSpeed = 7;

}
