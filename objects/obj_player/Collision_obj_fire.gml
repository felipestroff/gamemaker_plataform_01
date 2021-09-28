if (hp > 0 && can_damage) {
	can_damage = false;
			
	// Wait selected weapon fire delay
	alarm[1] = obj_fire.dmg_delay;
	
	hp -= obj_fire.dmg;
	
	image_alpha = 0.5;
}