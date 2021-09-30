// @description Give weapon or ammo
// Give ammo
if (array_length(other.weapons) > 1 && other.weapons[1] != undefined) {
	other.weapons[1].bullet_count += bullet_count;
}
// Give weapon
else {
	other.weapon = self // Set this weapon to the player
	other.weapons[1] = self; // Slot 2
}

instance_destroy();