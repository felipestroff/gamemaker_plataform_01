/// @description Check player HP

var player = obj_player;
var spr_index = asset_get_index("spr_player_status_01");

// Check player HP
if (player.hp <= 99 && player.hp >= 79) {
	spr_index = asset_get_index("spr_player_status_02");
}
else if (player.hp <= 80 && player.hp >= 60) {
	spr_index = asset_get_index("spr_player_status_03");
}
else if (player.hp <= 59 && player.hp >= 30) {
	spr_index = asset_get_index("spr_player_status_04");
}
else if (player.hp <= 29 && player.hp >= 10) {
	spr_index = asset_get_index("spr_player_status_05");
}
if (player.hp <= 0) {
	spr_index = asset_get_index("spr_player_status_06");
}

sprite_index = spr_index;