/// scr_cold(temp)
if(global.hours != hour && global.minutes == 0){
    if(global.Temperature<argument0)
        isCold = true;
    hour=global.hours;
}

if(isCold){
    isCold = false;
    Health-=10;
}
