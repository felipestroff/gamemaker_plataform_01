/// @description I.A
var player = obj_player;
var player_direction = point_direction(x, y, player.x, player.y);

#region MOVEMENT

if (instance_exists(player) && player.hp > 0) {
	// Follow player
	if (distance_to_object(player) < sight) {
		// Check player direction to follow the player
		// Right
		if (player_direction < 45 || player_direction >= 315) {
			x += spd;
			image_xscale = 1;
		}
		// Left
		else if (player_direction >= 135 && player_direction < 225) {
			x -= spd;
			image_xscale = -1;
		}
		
		sprite_index = asset_get_index("spr_zombie_move");
	}
	// Stop
	else {
		speed = 0;
		sprite_index = asset_get_index("spr_zombie_idle");
	}
}

#endregion

#region HP

if (hp <= 0) {
	instance_destroy();
}

#endregion