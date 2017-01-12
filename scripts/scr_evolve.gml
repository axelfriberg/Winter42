/// scr_evolve(option) option - 1. for blacksmith, 2. for scavanger, 3. for cook

switch (argument0){
    case 1:
        instance_destroy();
        evolved=instance_create(x,y,obj_blacksmith);
        with(evolved){
            global.Selected=id;
            Name=other.Name;
            Health=other.Health;
            Morale=other.Morale;
            AmmoSkill = 5;
            FightSkill = other.FightSkill;
            CookSkill = other.CookSkill;
            SocialSkill = other.SocialSkill;
            ScavengingSkill = other.ScavengingSkill;
        }
        //soldierID = instance_place(x+10, y+10, obj_blacksmith);
        break;
    case 2:
        instance_destroy();
        evolved=instance_create(x,y,obj_scavenger);
        with(evolved){
            global.Selected=id;
            Name=other.Name;
            Health=other.Health;
            Morale=other.Morale;
            AmmoSkill = other.AmmoSkill;
            FightSkill = other.FightSkill;
            CookSkill = other.CookSkill;
            SocialSkill = other.SocialSkill;
            ScavengingSkill = 5
        }
        break;
    case 3:
        instance_destroy();
        evolved=instance_create(x,y,obj_cook);
        with(evolved){
            global.Selected=id;
            Name=other.Name;
            Health=other.Health;
            Morale=other.Morale;
            AmmoSkill = other.AmmoSkill;
            FightSkill = other.FightSkill;
            CookSkill = 5;
            SocialSkill = other.SocialSkill;
            ScavengingSkill = other.ScavengingSkill;
        }
        break;
}
