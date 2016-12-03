///scr_randomMovements(amount,view)

if(random(1000)>990&&!Move&&!isOut&&!Busy&&!isSelected){
    //deleting textbox

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
    show_debug_message("X: "+string(MoveX)+" Y: "+string(fl));
}
