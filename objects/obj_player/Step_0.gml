#region CONTROLS
key_right = keyboard_check(ord("D")); // Right (+x)
key_left = keyboard_check(ord("A")); // Left (-x)
key_jump = keyboard_check(vk_space); // Jump (+y)
key_shoot = mouse_check_button(mb_left); // Shoot
key_enter = keyboard_check(vk_enter); // Enter
#endregion

// If player is not dead
if (hp > 0) {
	#region MOVEMENT
	
	var move = key_right - key_left;

	hspd = move * spd;
	vspd = vspd + grv;

	// Horizontal collision
	if (place_meeting(x + hspd, y, obj_block)) {
		while (!place_meeting(x + sign(hspd), y, obj_block)) {
			x = x + sign(hspd);
		}
		hspd = 0;
	}

	// Vertical collision
	if (place_meeting(x, y + vspd,  obj_block)) {
		while (!place_meeting(x, y + sign(vspd), obj_block)) {
			y = y + sign(vspd);
		}
		vspd = 0;
	}

	// Jump
	if (place_meeting(x, y + 1, obj_block) && key_jump) {
		vspd -= 8;
	}
	
	if (hspd != 0) {
		sprite_index = asset_get_index("spr_player_move");
		image_xscale = sign(hspd);
	}
	else {
		if (weapon != "") {
			sprite_index = asset_get_index("spr_player_" + string(weapon) + "_idle");
		}
		else {
			sprite_index = asset_get_index("spr_player_idle");
		}
	}
	
	if (vspd != 0) {
		sprite_index = asset_get_index("spr_player_jump");
	}
	
	// Set movement
	x = x + hspd;
	y = y + vspd;

	#endregion

	#region WEAPONS

	// Slots
	if (count_weapons > 1) {
		switch (keyboard_key) {
			case ord("1"):
				weapon = "pistol";
				fire_delay = 30;
				break;
			case ord("2"):
				weapon = "shotgun";
				fire_delay = 60;
				break;
		}
	}

	// Shoot
	if (weapon != "") {	
		if (key_shoot) {
			if (can_shoot) {
				can_shoot = false;
			
				// Wait selected weapon fire delay
				alarm[0] = fire_delay;
				
				// Change player sprite to firing weapon
				sprite_index = asset_get_index("spr_player_" + string(weapon) + "_firing");
			
				instance_create_layer(x, y, "lyr_bullet", obj_bullet);
			}
			else {
				sprite_index = asset_get_index("spr_player_" + string(weapon) + "_fire_idle");
			}
		}
	}

	#endregion
}

#region HP

if (hp <= 0) {
	can_damage = false;

	sprite_index = asset_get_index("spr_player_dead");
	image_alpha = 1;
	
	if (key_enter) {
		// Move player to start
		x = xstart;
		y = ystart;
	
		// Reset attrs
		hp = 100;
		can_damage = true;
	}
}

#endregion