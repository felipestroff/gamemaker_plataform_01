if (array_length(weapons) > 0 && weapons[0] != undefined) {
	weapons[0].bullet_count += other.bullet_count;
}
else {
	weapon = other;
	weapons[0] = weapon;
}

instance_destroy(other);