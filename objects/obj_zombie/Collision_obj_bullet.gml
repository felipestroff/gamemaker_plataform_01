var bullet_dmg =  other.dmg;

hp -= bullet_dmg;

// Damage recoil
if (other.image_xscale == 1) {
	x += other.dmg_recoil;
}
else {
	x -= other.dmg_recoil;
}

// Damage indicator
with instance_create_layer(x, (bbox_top - 20), "lyr_interface", obj_text) {
	text = bullet_dmg;
	size = 1;
	color_1 = c_yellow;
	color_2 = c_red;
	alarm[0] = 40;
}

// Damage red effect
image_blend = 200;

// Reset red effect
alarm[0] = 15;