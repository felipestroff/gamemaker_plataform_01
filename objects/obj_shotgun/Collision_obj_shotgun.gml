// @description Give weapon or ammo
// Give ammo
if (array_length(other.weapons) > 0 && other.weapons[1] != undefined) {
	other.weapons[0].bullet_count += bullet_count;
}
// Give weapon
else {
	other.weapon = self;
	other.weapons[1] = weapon;
}

instance_destroy();