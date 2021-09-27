spd = 0;
dmg = 0;

var player = obj_player;

x = player.x;
y = player.y;

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

// Change bullet sprite for weapon
sprite_index = asset_get_index("spr_bullet_" + string(player.weapon))

// Check player weapon
switch (player.weapon) {
	case "pistol":
		y = y + 9;
		dmg = random_range(15, 35);
		spd = 10;
		break;
	case "shotgun":
		y = y + 14;
		dmg = random_range(50, 100);
		spd = 15;
		break;
}

speed = spd;