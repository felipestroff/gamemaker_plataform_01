spd = 10;

var player = obj_player;

x = player.x;
y = player.y + 14;

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