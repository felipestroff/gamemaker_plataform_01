#region CONTROLS
key_right = keyboard_check(ord("D")); // Right (+x)
key_left = keyboard_check(ord("A")); // Left (-x)
key_jump = keyboard_check(vk_space); // Jump (+y)
key_shot = mouse_check_button(mb_left); // Shot
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
			break;
		case ord("2"):
			weapon = "shotgun";
			break;
	}
}

// Shot
if (weapon != "") {	
	if (key_shot) {
		var fire_sprite = asset_get_index("spr_player_" + string(weapon) + "_fire");
		sprite_index = fire_sprite;
	
		instance_create_layer(x, y, "lyr_bullet", obj_bullet);
	}
	else {
		var sprite = asset_get_index("spr_player_" + string(weapon));
		sprite_index = sprite;
	}
}

#endregion