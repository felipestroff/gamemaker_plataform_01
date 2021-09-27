#region CONTROLS
key_right = keyboard_check(ord("D")); // Right (+x)
key_left = keyboard_check(ord("A")); // Left (-x)
key_jump = keyboard_check(vk_space); // Jump (+y)
key_shoot = mouse_check_button(mb_left); // Shoot
#endregion

#region MOVEMENT
var move = key_right - key_left;

hspd = move * spd;
vspd = vspd + grv;

if (hspd != 0) {
	image_xscale = sign(hspd);
}

// Horizontal collision
if (place_meeting(x + hspd, y, obj_block)) {
	while (!place_meeting(x + sign(hspd), y, obj_block)) {
		x = x + sign(hspd);
	}
	hspd = 0;
}
x = x + hspd;

// Vertical collision
if (place_meeting(x, y + vspd,  obj_block)) {
	while (!place_meeting(x, y + sign(vspd), obj_block)) {
		y = y + sign(vspd);
	}
	vspd = 0;
}
y = y + vspd;

// Jump
if (place_meeting(x, y + 1, obj_block) && key_jump) {
	vspd -= 8;
}

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
			
			instance_create_layer(x, y, "lyr_bullet", obj_bullet);
		}
		
		// Change player sprite to firing weapon
		sprite_index = asset_get_index("spr_player_" + string(weapon) + "_fire");
	}
	else {
		// Change player sprite to weapon
		sprite_index = asset_get_index("spr_player_" + string(weapon));
	}
}

#endregion

#region HP

if (hp <= 0) {
	// Move player to start
	x = obj_portal.x;
	y = obj_portal.y;
	
	// Reset HP
	hp = 100;
}

#endregion