/// @description Takes delayed damage
if (can_damage) {
	hp -= other.dmg;
	
	alarm[0] = other.dmg_delay;
}