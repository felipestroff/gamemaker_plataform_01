/// @description Movement
hspd = spd;
vspd = vspd + grv;

var block = obj_block;

// Horizontal collision with blocks
if (place_meeting(x + hspd, y, block)) {
	// As long as it doesn't collide with the block
	while (!place_meeting(x + sign(hspd), y, block)) {
		x = x + sign(hspd); // Set normal horizontal speed
	}
	// Stop
	hspd = 0;
}

// Vertical collision with blocks
if (place_meeting(x, y + vspd,  block)) {
	// As long as it doesn't collide with the block
	while (!place_meeting(x, y + sign(vspd), block)) {
		y = y + sign(vspd); // Set normal vertical speed
	}
	// Stop
	vspd = 0;
}

// Set movement
y = y + vspd;