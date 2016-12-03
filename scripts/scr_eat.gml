/// scr_eat(time_of_eating)
// character eats at time passed as first argument 

if(global.hours == argument0 && global.minutes == 0 && canEat){
    canEat = false;
    if(global.CookedFood > 0){
        global.CookedFood -= 1;
    } 
    else{ 
        Health-=20;
    }
}
if(global.hours == argument0 && global.minutes == 1){
    canEat = true;
}

