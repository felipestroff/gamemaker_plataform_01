if (array_length(weapons) > 1 && weapons[1] != undefined) {
	weapons[1].bullet_count += other.bullet_count;
}
else {
	weapon = other;
	weapons[1] = weapon;
}

instance_destroy(other);