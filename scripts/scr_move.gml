//deleting textbox
    if(object_exists(obj_textbox))
    {
        var textbox  = instance_place(x-200, y-100, obj_textbox);
        if textbox != noone
        {   
            with(textbox) instance_destroy();
        }
    }
    if(onWatch){
        global.isWatchLeft=false;
        global.isWatchRight=false;
        onWatch=false;
    }
    Busy = false
    Completed = false
    pointDistance = point_distance(x,y,MoveX,y)
    move_towards_point(MoveX, y, min(MoveSpeed, pointDistance))
    if x == MoveX && y==MoveY {
        pointDistance = point_distance(x,y,MoveX,MoveY)
        move_towards_point(MoveX, MoveY, min(MoveSpeed, pointDistance))
        if(y==MoveY){
            Move = false
        }
        if (x == obj_pot.x-32 && y== obj_pot.y)&&Cooking{
            if(global.RawFood>0){    
                Busy = true;
                audio_play_sound(snd_cooking,0,0);
                scr_dialogue("Let's cook some food...", x-260, y-130);
                alarm[0] = 120/global.multiplier;
            }
            else {
                scr_dialogue("Looks like there's no food left...", x-260, y-130);
                Cooking=false;
            }
        }
        else if ((place_meeting(x-32,y,obj_soldier)||place_meeting(x+32,y,obj_soldier))&&!isMedic&&Interact){
                secondSoldier = instance_place(x-32, y, obj_soldier); 
                if(!instance_exists(secondSoldier))
                    secondSoldier = instance_place(x+32, y, obj_soldier); 
                scr_dialogue("Good morning, soldat!", x-260, y-130);
                if(instance_exists(secondSoldier)){
                    secondSoldier.isTarget=false;
                }
                Interact = false       
        }
         else if ((place_meeting(x-32,y,obj_soldier)||place_meeting(x+32,y,obj_soldier))&&isMedic&&global.Scraps>0&&Interact){
                secondSoldier = instance_place(x-32, y, obj_soldier); 
                if(!instance_exists(secondSoldier))
                    secondSoldier = instance_place(x+32, y, obj_soldier); 
                global.Scraps-=1;
                if(instance_exists(secondSoldier)){
                    secondSoldier.sick = false;
                    if(secondSoldier.Health<100){
                        secondSoldier.Health+=10;
                        audio_play_sound(snd_heal,0,0);
                        scr_dialogue("There there.. I'll heal your wounds", x-260, y-130);
                        scr_popup(x, y-50,"-1", spr_scraps, 0.3, 0.3);
                    }
                    else {
                        scr_dialogue("Looks like you're in perfect shape!", x-260, y-130);
                    }
                    secondSoldier.isTarget=false;
                }
                Interact = false 
                
        }
        else if place_meeting(x,y,obj_door)&&GoOut{ 
                if(isGeneral){
                    scr_dialogue("Shouldn't be leaving, I'm more useful here...", x-260, y-130);
                    GoOut=false;
                }else{
                    audio_play_sound(snd_door,0,0);
                    /*scr_dialogue("I'm going to find some resources...", x-260, y-130); 
                    alarm[3]=60;
                    Busy=true;
                    alarm[1] = 900/global.multiplier;
                    isOut=true;
                    selected=-1;
                    */
                    with(obj_controller){
                        messageCheck = true;
                        attackBuffer = alarm[2];
                        stormBuffer = alarm[0];
                        alarm[2] = -1;
                        alarm[0] = -1;
                        scr_pause();
                        screenHide = instance_create(view_wview[0]/2, view_hview[0]/2, obj_darkenScreen);
                        menuBg = instance_create(view_wview[0]/2,  view_hview[0]/2, obj_menuBg);
                        backyardButton = instance_create(view_xview[0]+view_wview[0]/2-215, view_yview[0]+view_hview[0]/2, obj_outBackyard);
                        fieldButton = instance_create(view_xview[0]+view_wview[0]/2, view_yview[0]+view_hview[0]/2, obj_outField);
                        campButton = instance_create(view_xview[0]+view_wview[0]/2+215, view_yview[0]+view_hview[0]/2, obj_outCamp);
                    }
                }     
        }
        else if place_meeting(x+16,y-32,obj_crafting)&&CraftDefenses{ 
                    audio_play_sound(snd_blacksmith,0,0);
                    with(obj_controller){
                        messageCheck = true;
                        attackBuffer = alarm[2];
                        stormBuffer = alarm[0];
                        alarm[2] = -1;
                        alarm[0] = -1;
                        scr_pause();
                        screenHide=instance_create(view_wview[0]/2, view_hview[0]/2, obj_darkenScreen);
                        craftTurret=instance_create(view_xview[0]+view_wview[0]/2-600, view_yview[0]+view_hview[0]/2-200, obj_craftTurret);
                        craftSpikes=instance_create(view_xview[0]+view_wview[0]/2+200, view_yview[0]+view_hview[0]/2-200, obj_craftSpikes);
                        craftLeftTurret=instance_create(view_xview[0]+view_wview[0]/2-600, view_yview[0]+view_hview[0]/2, obj_craftLeftTurret);
                        craftRightTurret=instance_create(view_xview[0]+view_wview[0]/2-400, view_yview[0]+view_hview[0]/2, obj_craftRightTurret);
                        craftLeftSpikes=instance_create(view_xview[0]+view_wview[0]/2+200, view_yview[0]+view_hview[0]/2, obj_craftLeftSpikes);
                        craftRightSpikes=instance_create(view_xview[0]+view_wview[0]/2+400, view_yview[0]+view_hview[0]/2, obj_craftRightSpikes);
                        craftCancel=instance_create(view_xview[0]+view_wview[0]/2-100, view_yview[0]+view_hview[0]/2+200, obj_craftCancel);
                    }     
                
        }
        else if place_meeting(x,y,obj_table)&&Eating{ 
                    Busy=true;
                    if(global.CookedFood > 0){
                         scr_dialogue("Mmm, delicious!", x-260, y-130);
                    } 
                    else{ 
                        scr_dialogue("No food for me? I'm getting hungry :(", x-260, y-130);
                    }
                    alarm[4] = 200/global.multiplier;
        }
        else if (x == obj_anvil.x-50 && y == obj_anvil.y - 11)&&CraftingAmmo{  
            if(global.Scraps > 0){ 
                scr_dialogue("Making some ammuniton...", x-260, y-130);
                Busy=true;
                audio_play_sound(snd_blacksmith,0,5);
                alarm[0]=120/global.multiplier;
            }
            else{
                scr_dialogue("Looks like there's no scrap left...", x-260, y-130);
            }  
        }
        else if (instance_exists(obj_sentry))&&(x == obj_sentry.x-20 && y == obj_sentry.y+11)&&goToWatch{  
            if(global.Ammunition > 0){
                audio_play_sound(snd_gun,0,0); 
                scr_dialogue("I'll be on watch now", x-260, y-130);
                alarm[3]=60;
                Busy=true;
                onWatch=true;
                global.isWatchRight = true;
            }
            else{
                onWatch=false;
                global.isWatchRight = false;
                scr_dialogue("No ammunition left... No point of being on the watch", x-260, y-130);
            }  
        }
        else if (instance_exists(obj_leftSentry)&&(x == obj_leftSentry.x+50 && y == obj_leftSentry.y+11)&&goToWatch){  
            if(global.Ammunition > 0){
                audio_play_sound(snd_gun,0,0); 
                scr_dialogue("I'll be on watch now", x-260, y-130);
                alarm[3]=60;
                Busy=true;
                onWatch=true;
                global.isWatchLeft = true;
            }
            else{
                onWatch=false;
                global.isWatchLeft = false;
                scr_dialogue("No ammunition left... No point of being on the watch", x-260, y-130);
            }  
        }
        else if place_meeting(x-30,y-10,obj_chimney)&&makingFire{ 
            if(global.Temperature > 22){
                scr_dialogue("Shouldn't make it any hotter", x-260, y-130);               
            } else {
                 if(global.Scraps > 0){
                    audio_play_sound(snd_fire,0,5);    
                    scr_dialogue("Making a fire...", x-260, y-130);
                    Busy=true;
                    alarm[2] = 120/global.multiplier;   
                }
                else {
                    makingFire=false;
                    scr_dialogue("Looks like there's no scrap left...", x-260, y-130);scr_dialogue("Looks like there's no scrap left...", x-260, y-130);
                }
            }         
        }
        
    }  
    // Using stairs to move around
    else if y!=MoveY{
        var stairsFloor0=instance_place(432, 900, obj_stairs);
        var stairsFloor1=instance_place(520, 720, obj_stairs);
        var stairsFloor2=instance_place(420, 540, obj_stairs);
        // we have 4 floors, therefore both person and target can be in any of them
        if(MoveY<y){
            if(y<=928&&y>736){ //person in floor0
                if(x==stairsFloor0.x){
                    pointDistance = point_distance(x,y,x,stairsFloor0.y-192);
                    move_towards_point(x, stairsFloor0.y-192, min(MoveSpeed, pointDistance));
                } else {
                    pointDistance = point_distance(x,y,stairsFloor0.x,y);
                    move_towards_point(stairsFloor0.x, y, min(MoveSpeed, pointDistance));
                }
            }else if(y<=736&&y>544){ //person in floor1

                if(x==stairsFloor1.x){
                    pointDistance = point_distance(x,y,x,stairsFloor1.y-192);
                    move_towards_point(x, stairsFloor1.y-192, min(MoveSpeed, pointDistance));
                }
                else{
                    pointDistance = point_distance(x,y,stairsFloor1.x,y);
                    move_towards_point(stairsFloor1.x, y, min(MoveSpeed, pointDistance));
                }
                
            }else if(y<=544&&y>320){ //person in floor2
                if(x==stairsFloor2.x){
                    pointDistance = point_distance(x,y,x,stairsFloor2.y-192);
                    move_towards_point(x, stairsFloor2.y-192, min(MoveSpeed, pointDistance));
                }
                else{
                    pointDistance = point_distance(x,y,stairsFloor2.x,y);
                    move_towards_point(stairsFloor2.x, y, min(MoveSpeed, pointDistance))
                }
            }
        }else{ // going down
            if(y>=736){ //person in floor1

                if(x==stairsFloor0.x){
                    pointDistance = point_distance(x,y,x,stairsFloor0.y);
                    move_towards_point(x, stairsFloor0.y, min(MoveSpeed, pointDistance));
                }
                else{
                    pointDistance = point_distance(x,y,stairsFloor0.x,y);
                    move_towards_point(stairsFloor0.x, y, min(MoveSpeed, pointDistance));
                }
                
            }else if(y<736&&y>=544){ //person in floor2
                if(x==stairsFloor1.x){
                    pointDistance = point_distance(x,y,x,stairsFloor1.y);
                    move_towards_point(x, stairsFloor1.y, min(MoveSpeed, pointDistance));
                }
                else{
                    pointDistance = point_distance(x,y,stairsFloor1.x,y);
                    move_towards_point(stairsFloor1.x, y, min(MoveSpeed, pointDistance))
                }
                
            }else if(y<544&&y>=352){ //person in floor3
                if(x==stairsFloor2.x){
                    pointDistance = point_distance(x,y,x,stairsFloor2.y);
                    move_towards_point(x, stairsFloor2.y, min(MoveSpeed, pointDistance));
                }
                else{
                    pointDistance = point_distance(x,y,stairsFloor2.x,y);
                    move_towards_point(stairsFloor2.x, y, min(MoveSpeed, pointDistance))
                }
            }
        }
    }
