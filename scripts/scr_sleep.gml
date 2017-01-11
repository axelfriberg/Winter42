/// scr_sleep(time_of_sleeping-1 hour)
// character goes to bed at time passed as first argument 

if(global.hours == argument0 && global.minutes == 45){
    if place_meeting(x, y, obj_general){
        scr_dialogue("Sleeping time!",x-260, y-130);
    }
    Move=true;
    for(var i=0;i<5;i++){
        if(global.bedTaken[i]==false){
            global.bedTaken[i]=true;
            bed=i;
            break;
        }
    }
    OldX=x;
    OldY=y;
    Sleep=true;
    MoveX=obj_bed.x+64*bed;
    MoveY=obj_bed.y+16;
}
