var bullet = obj_bullet;

hp -= bullet.dmg;

instance_destroy(bullet);

image_blend = 200;

alarm[0] = 15;