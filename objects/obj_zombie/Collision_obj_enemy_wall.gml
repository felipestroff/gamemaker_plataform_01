/// @description Stop

if (image_xscale == 1) {
	x -= spd;
}
else {
	x += spd;
}

sprite_index = asset_get_index("spr_zombie_idle");