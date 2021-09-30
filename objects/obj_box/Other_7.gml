/// @description Spawn itens and destroy
// Spawn ammo
if (array_length(obj_player.weapons) >= 1) {
	// Pistol
	for (var i = 0; i < random_pistol_ammo; i += 1) {
		// Spawn on random location
		var random_x = random_range(10, 50);
		var random_y = random_range(10, 100);
		var ammo = instance_create_layer((x - random_x) + (10 * i), y - random_y, "lyr_instance", obj_ammo);
	
		ammo.weapon_index = 0;
		ammo.vspd -= ammo.spd;
		ammo.sprite_index = asset_get_index("spr_bullet_pistol");	
		ammo.image_angle = random_range(0, 360);
	}
}

// Destroy box
instance_destroy();