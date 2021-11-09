#region CONTROLS
key_right = keyboard_check(ord("D")); // Right (+x)
key_left = keyboard_check(ord("A")); // Left (-x)
key_up = keyboard_check(ord("W")); // Up (-y)
key_down = keyboard_check(ord("S")); // Down (+y)
key_jump = keyboard_check(vk_space); // Jump (-y)
key_shoot = mouse_check_button(mb_left); // Shoot
key_enter = keyboard_check(vk_enter); // Enter
#endregion

// Player not dead?
if (hp > 0) {
	#region MOVEMENT
	
	var move = key_right - key_left;

	hspd = move * spd; // Horizontal speed
	vspd = vspd + grv; // Vertical speed

	// Horizontal collision with blocks
	if (place_meeting(x + hspd, y, obj_block)) {
		// As long as it doesn't collide with the block
		while (!place_meeting(x + sign(hspd), y, obj_block)) {
			x = x + sign(hspd); // Set normal horizontal speed
		}
		// Stop
		hspd = 0;
	}

	// Vertical collision with blocks
	if (place_meeting(x, y + vspd,  obj_block)) {
		// Jump
		if (key_jump && can_jump) {
			can_jump = false;
			vspd -= jump_spd;
		}
		// Normal
		else {
			// As long as it doesn't collide with the block
			while (!place_meeting(x, y + sign(vspd), obj_block)) {
				y = y + sign(vspd); // Set normal vertical speed
			}
			// Stop
			vspd = 0;
			can_jump = true;
		}
	}
	// Vertical collision with stairs
	else if (place_meeting(x, y + vspd,  obj_stair)) {
		vspd = 0;
		
		if (key_up) {
			vspd -= 2;
		}
		else if (key_down) {
			vspd += 2;
		}
	}
	
	// Sprites
	// Moving ?
	if (hspd != 0) {
		state = "move";
		image_speed = 0.3;
		image_xscale = sign(hspd);
	}
	// Idle
	else {
		// Weapon animation
		if (array_length(weapons) > 0) {
			state = weapon.alias + "_idle";
		}
		// Normal animation
		else {
			state = "idle"
		}
		
		image_speed = 0.1;
	}
	
	// Jumping?		
	if (vspd != 0) {
		state = "jump";
	}

	#endregion

	#region WEAPONS

	// Player weapon count
	if (array_length(weapons) > 0) {
		// Enable slot for more weapons
		if (array_length(weapons) > 1) {
			switch (keyboard_key) {
				case ord("1"): // Pistol
					weapon = weapons[0];
					break;
				case ord("2"): // Shotgun
					weapon = weapons[1];
					break;
			}
		}
	
		// Shooting (not in jump)
		if (key_shoot && !key_jump) {
			hspd = 0;
			
			// Player can shoot and has bullets on selected weapon?
			if (can_shoot && weapon.bullet_count > 0) {
				can_shoot = false;
			
				// Wait selected weapon fire delay
				alarm[0] = weapon.fire_delay;
				
				state =  weapon.alias + "_firing";
			
				// Fire
				instance_create_layer(x, y, "lyr_bullet", obj_bullet);
				
				// Use bullet
				weapon.bullet_count -= 1;
			}
			else {
				state = weapon.alias + "_fire_idle";
			}
		}
	}

	#endregion
	
	// Change player sprite by current state
	sprite_index = asset_get_index("spr_player_" + state);
}

#region HP

// Death
if (hp <= 0) {
	// Reset speeds
	hspd = 0;
	vspd = 0;
	
	can_damage = false; // Disable damage

	sprite_index = asset_get_index("spr_player_dead"); // Change sprite
	image_alpha = 1; // Set full sprite opacity
	
	// Press enter to continue...
	if (key_enter) {
		// Move player to start
		x = xstart;
		y = ystart;
	
		// Reset attrs
		hp = 100; // Restore HP
		can_damage = true; // Enable damage
	}
}

#endregion

// Set full movement
x = x + hspd;
y = y + vspd;