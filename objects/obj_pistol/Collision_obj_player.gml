// @description Give weapon or ammo
// Give ammo
if (array_length(other.weapons) > 0 && other.weapons[0] != undefined) {
	other.weapons[0].bullet_count += bullet_count;
}
// Give weapon
else {
	other.weapon = self; // Set this weapon to the player
	other.weapons[0] = self; // Slot 1
}

instance_destroy();