if (can_fire) {
	can_fire = false;

	fire = instance_create_layer(x, y, "lyr_instance", obj_fire);

	alarm[1] = dmg_delay;
}