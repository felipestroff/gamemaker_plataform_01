/// @description I.A
#region MOVEMENT

hspd = spd;
vspd = vspd + grv;

var block = obj_block;
var enemy_wall = obj_enemy_wall;

// Horizontal collision
if (place_meeting(x + hspd, y, block)) {
	if (image_xscale == 1) {
		x -= hspd;
	}
	else {
		x += hspd;
	}
}

// Vertical collision
if (place_meeting(x, y + vspd,  block)) {
	while (!place_meeting(x, y + sign(vspd), block)) {
		y = y + sign(vspd);
	}
	vspd = 0;
}

// Follow player
var player = obj_player;
var player_direction = point_direction(x, y, player.x, player.y);

if (instance_exists(player) && player.hp > 0) {
	// Ranged attack
	if (distance_to_object(player) < sight) {
		// Meele attack when player is close to enemy or enemy is not blocked by block/wall
		if (distance_to_object(player) <= dmg_range && !place_meeting(x + hspd, y, enemy_wall)) {
			// Check player direction to follow the player
			// Right
			if (player_direction < 45 || player_direction >= 315) {
				x += hspd;
				image_xscale = 1;
			}
			// Left
			else if (player_direction >= 135 && player_direction < 225) {
				x -= hspd;
				image_xscale = -1;
			}
		
			//sprite_index = asset_get_index("spr_imp_meele_attack");
		}
		// Ranged attack
		else {
			if (can_shoot) {
				can_shoot = false;
			
				// Fire ball
				var fireball = instance_create_layer(x, y, "lyr_bullet", obj_fire);
				with (fireball)
				{
					// Give the fireball a direction
					direction = point_direction(x, y, player.x, player.y);
					speed = other.special_dmg_speed;
					dmg = other.special_dmg;
				
					image_blend = 250;
				}
			
				//sprite_index = asset_get_index("spr_imp_ranged_attack");
		
				// Wait special damage delay
				alarm[1] = special_dmg_delay;
			}
		}
	}
	// Stop
	else {
		sprite_index = asset_get_index("spr_imp_idle");
	}
}

// Set movement
y = y + vspd;

#endregion

#region HP

if (hp <= 0) {
	instance_destroy();
}

#endregion