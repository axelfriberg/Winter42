/// scr_cold(temp) 
if(isCold){
    isCold = false;
    Health-=10;
}
if(global.hours != hour && global.minutes == 0 && global.Temperature<argument0){
    isCold = true;
    hour=global.hours;
}

