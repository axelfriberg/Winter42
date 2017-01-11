/// scr_eat(time_of_eating)
// character eats at time passed as first argument 

if(global.hours == argument0 && global.minutes == 0 && canEat){
    canEat = false;
    if place_meeting(x, y, obj_cook){
        scr_dialogue("Dinner time!",x-260, y-130);
    }
    Move=true;
    for(var i=0;i<5;i++){
        if(global.tableSeat[i]==false){
            global.tableSeat[i]=true;
            table=i;
            break;
        }
    }
    OldX=x;
    OldY=y;
    Eating=true;
    MoveX=obj_table.x+32*table;
    MoveY=obj_table.y;
}
if(global.hours == argument0 && global.minutes == 1){
    canEat = true;
}

