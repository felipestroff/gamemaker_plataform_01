if (hp > 0 && can_damage) {
	can_damage = false;
			
	// Wait selected weapon fire delay
	alarm[1] = other.dmg_delay;
	
	hp -= other.dmg;
	
	image_alpha = 0.5;
	
	// Damage recoil
	if (vspd == 0) {
		x += other.sprite_width;
	}
}