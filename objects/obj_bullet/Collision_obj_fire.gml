/// @description Fire damage
// Check player weapon
switch (player.weapon.alias) {
	case "pistol":
	case "shotgun":
		special_dmg = floor(dmg * 1.25);
		sprite_index = asset_get_index("spr_bullet_fire");
		break;
}

dmg = special_dmg;