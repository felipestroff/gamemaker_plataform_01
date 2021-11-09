if (special_dmg > 0) {
	fire = instance_create_layer(x, y, "lyr_instance", obj_fire);
	fire.alarm[0] = 240;
}

sprite_index = asset_get_index("spr_bullet_block");

alarm[0] = 1;