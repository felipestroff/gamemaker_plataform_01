hp -= other.dmg;

// Damage recoil
if (image_xscale == 1) {
	x -= obj_player.weapon.dmg_recoil;
}
else {
	x += obj_player.weapon.dmg_recoil;
}

// Damage red effect
image_blend = 200;

// Reset red effect
alarm[0] = 15;