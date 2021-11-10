hp = 150;
sight = 600;
spd = 3;
hspd = 0;
vspd = 0;
grv = 0.4;
dmg = irandom_range(20, 35);
dmg_delay = 60;
dmg_range = 200;
special_dmg = irandom_range(30, 50);
special_dmg_delay = 120;
special_dmg_speed = 6;
can_shoot = true;
can_alert = true;

image_speed = 0.1;

function rangedAttack() {
	if (can_shoot) {
		can_shoot = false;
		
		var player = obj_player;
			
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
			
		//sprite_index = asset_get_index("spr_imp_attack");
		
		// Wait special damage delay
		alarm[1] = special_dmg_delay;
	}
}