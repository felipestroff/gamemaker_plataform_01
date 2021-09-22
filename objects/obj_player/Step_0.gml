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
if (place_meeting(x + hspd, y, obj_wall)) {
	while (!place_meeting(x + sign(hspd), y, obj_wall)) {
		x = x + sign(hspd);
	}
	hspd = 0;
}
x = x + hspd;

// Vertical collision
if (place_meeting(x, y + vspd,  obj_floor)) {
	while (!place_meeting(x, y + sign(vspd), obj_floor)) {
		y = y + sign(vspd);
	}
	vspd = 0;
}
y = y + vspd;

// Jump
if (place_meeting(x, y + 1, obj_floor) and key_jump) {
	vspd -= 8;
}

// Shot
if (got_gun) {
	if (key_shot) {
		sprite_index = spr_player_shotgun_fire;
	
		instance_create_layer(x, y, "lyr_bullet", obj_bullet);
	}
	else {
		sprite_index = spr_player_shotgun;
	}
}

#endregion