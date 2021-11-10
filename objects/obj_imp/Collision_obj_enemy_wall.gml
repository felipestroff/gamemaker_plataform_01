/// @description Stop
if (image_xscale == 1) {
	x -= hspd;
}
else {
	x += hspd;
}

sprite_index = asset_get_index("spr_imp_idle");

// Start ranged attack
rangedAttack();