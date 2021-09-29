spd = 0;
dmg = 0;
special_dmg = 0;
player = obj_player;
fire = "";

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
sprite_index = asset_get_index("spr_bullet_" + string(player.weapon));
image_speed = 0.2;

// Check player weapon
switch (player.weapon) {
	case "pistol":
		y = y + 6;
		dmg = random_range(15, 35);
		spd = 10;
		break;
	case "shotgun":
		y = y + 9;
		dmg = random_range(50, 100);
		spd = 15;
		break;
}

speed = spd;