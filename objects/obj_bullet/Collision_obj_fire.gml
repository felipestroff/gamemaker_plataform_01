/// @description Fire damage
// Check player weapon
switch (player.weapon) {
	case "pistol":
	case "shotgun":
		special_dmg = dmg * 1.25;
		sprite_index = asset_get_index("spr_bullet_fire");
		break;
}

dmg = special_dmg;