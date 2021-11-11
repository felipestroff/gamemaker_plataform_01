/// @description Try to break block
if (can_dmg) {
	can_dmg = false;
	
	other.x += 20;

	hp -= other.dmg;
	
	alarm[0] = other.dmg_delay;
}