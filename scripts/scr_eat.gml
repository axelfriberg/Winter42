/// scr_eat(time_of_eating)
// character eats at time passed as first argument 

if(global.hours == argument0 && global.minutes == 0 && canEat){
    canEat = false;
    if(global.CookedFood > global.Soldiers){
        global.CookedFood -= global.Soldiers;
    } 
    else{ 
        Health=Health-20;
    }
}
if(global.hours == argument0 && global.minutes == 1){
    canEat = true;
}

