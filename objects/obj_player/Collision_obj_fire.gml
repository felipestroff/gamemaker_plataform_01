if (hp > 0 && can_damage) {
	can_damage = false;
			
	// Wait selected weapon fire delay
	alarm[1] = other.dmg_delay;
	
	hp -= other.dmg;
	
	image_alpha = 0.5;
	
	// Fireball
	// Check if is moving fire
	if (other.speed > 0) {
		// Destroy fireball
		other.alarm[0] = 1;
	}
}