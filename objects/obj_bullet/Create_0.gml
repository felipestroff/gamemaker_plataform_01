spd = 10;
sprite = "";

var player = obj_player;

x = player.x;
y = player.y;

//direction = direction + random_range(-5, 5);
speed = spd;

// Copy player directions
if (player.image_xscale <= -1) {
	direction = 180;
	x = x - 30;
}
else {
	direction = 0;
	x = x + 30;
}
image_angle = direction;

// Check player weapon
switch (player.weapon) {
	case "pistol":
		y = y + 9;
		break;
	case "shotgun":
		y = y + 14;
		break;
}

// Change bullet sprite for weapon
var sprite = asset_get_index("spr_bullet_" + string(player.weapon));
sprite_index = sprite;