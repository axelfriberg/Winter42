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
        global.isWatch=false;
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
        if (x == obj_pot.x-32 && y== obj_pot.y){
            if(global.RawFood>0){    
                Busy = true;
                scr_dialogue("Let's cook some food...", x-260, y-130);
                alarm[0] = 60/global.multiplier;
            }
            else {
                scr_dialogue("Looks like there's no food left...", x-260, y-130);
            }
        }
        else if ((place_meeting(x-32,y,obj_soldier)||place_meeting(x+32,y,obj_soldier))&&!isMedic){
                secondSoldier = instance_place(x-32, y, obj_soldier); 
                if(!instance_exists(secondSoldier))
                    secondSoldier = instance_place(x+32, y, obj_soldier); 
                scr_dialogue("Good morning, soldat!", x-260, y-130);
                if(instance_exists(secondSoldier)){
                    secondSoldier.isTarget=false;
                }
        }
         else if ((place_meeting(x-32,y,obj_soldier)||place_meeting(x+32,y,obj_soldier))&&isMedic&&global.Scraps>0){
                secondSoldier = instance_place(x-32, y, obj_soldier); 
                if(!instance_exists(secondSoldier))
                    secondSoldier = instance_place(x+32, y, obj_soldier); 
                global.Scraps-=1;
                if(instance_exists(secondSoldier)){
                    secondSoldier.sick = false;
                    if(secondSoldier.Health<100){
                        secondSoldier.Health+=10;
                        scr_dialogue("There there.. I'll heal your wounds", x-260, y-130);
                    }
                    else {
                        scr_dialogue("Looks like you're in perfect shape!", x-260, y-130);
                    }
                    secondSoldier.isTarget=false;
                }
                
        }
        else if place_meeting(x,y,obj_door){ 
                if(isGeneral)
                     scr_dialogue("Shouldn't be leaving, I'm more useful here...", x-260, y-130);
                else{
                    scr_dialogue("I'm going to find some resources...", x-260, y-130);
                    Busy=true;
                    alarm[1] = 120/global.multiplier;
                    isOut=true;
                    selected=-1;
                }     
        }
        else if (x == obj_anvil.x-50 && y == obj_anvil.y - 11){  
            if(global.Scraps > 0){ 
                scr_dialogue("Making some ammuniton...", x-260, y-130);
                Busy=true;
                CraftingAmmo = true;
                alarm[0]=60/global.multiplier; 
            }
            else{
                scr_dialogue("Looks like there's no scrap left...", x-260, y-130);
            }  
        }
        else if (x == obj_sentry.x-20 && y == obj_sentry.y+11){  
            if(global.Ammunition > 0){ 
                scr_dialogue("I'll be on watch now", x-260, y-130);
                Busy=true;
                onWatch=true;
                global.isWatch = true;
            }
            else{
                global.isWatch = false;
                scr_dialogue("No ammunition left... No point of being on the watch", x-260, y-130);
            }  
        }
        else if place_meeting(x,y,obj_chimney){ 
            if(global.Temperature > 22){
                scr_dialogue("Shouldn't make it any hotter", x-260, y-130);               
            } else {
                 if(global.Scraps > 0){    
                    scr_dialogue("Making a fire...", x-260, y-130);
                    Busy=true;
                    makingFire = true;
                    alarm[2] = 60/global.multiplier;   
                }
                else {
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
