/// @description Check player HP
var player = obj_player;

// Check player HP
if (player.hp == 100) {
	sprite_index = asset_get_index("spr_player_status_01");
}
else if (player.hp >= 80 && player.hp < 100) {
	sprite_index = asset_get_index("spr_player_status_02");
}
else if (player.hp >= 60 && player.hp < 80) {
	sprite_index = asset_get_index("spr_player_status_03");
}
else if (player.hp >= 40 && player.hp < 60) {
	sprite_index = asset_get_index("spr_player_status_04");
}
else if (player.hp >= 20 && player.hp < 40) {
	sprite_index = asset_get_index("spr_player_status_05");
}
else if (player.hp <= 0) {
	sprite_index = asset_get_index("spr_player_status_06");
}