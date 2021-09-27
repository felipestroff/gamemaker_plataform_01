if (can_damage) {
	can_damage = false;
			
	// Wait selected weapon fire delay
	alarm[1] = obj_zombie.dmg_delay;
	
	hp -= obj_zombie.dmg;
	
	image_alpha = 0.5;
}