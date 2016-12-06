/// scr_cold(temp)
if(global.hours != hour && global.minutes == 0){
    if(global.Temperature<argument0)
        isCold = true;
    if(global.Temperature<argument1)
        isReallyCold = true;
    hour=global.hours;
}

if(isCold){
    isCold = false;
    Health-=10;
}
if(isReallyCold){
    isCold = false;
    Health-=20;
}
