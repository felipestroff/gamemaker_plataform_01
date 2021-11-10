/// @description I.A
#region MOVEMENT

hspd = spd;
vspd = vspd + grv;

var block = obj_block;

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
	if (distance_to_object(player) <= sight) {
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
		
		sprite_index = asset_get_index("spr_zombie_move");
		
		// Alert indicator
		if (can_alert) {
			with instance_create_layer(x, (bbox_top - 20), "lyr_interface", obj_text) {
				text = "!";
				size = 2;
				color_1 = c_orange;
				color_2 = c_yellow;
				alarm[0] = 30;
			}
			
			can_alert = false;
		}
	}
	// Stop
	else {
		can_alert = true;
		
		sprite_index = asset_get_index("spr_zombie_idle");
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