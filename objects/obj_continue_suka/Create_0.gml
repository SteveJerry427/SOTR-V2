// Inherit the parent event
event_inherited();
	
// Override data
vel_charge_target = 8;
vel_charge_acc = 0.125;
animation_data = [sprite_index, spr_suka_idle, spr_suka_walk, spr_suka_run];
	
ani_start(sprite_index, 10);