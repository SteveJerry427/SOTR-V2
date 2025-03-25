// Inherit the parent event
event_inherited();
	
display_timer = 0;
	
switch global.player_main
{
	case PLAYER_TAILS:
		sprite_index = spr_gui_continue_tails;
	break;
			
	case PLAYER_KNUCKLES:
		sprite_index = spr_gui_continue_knuckles;
	break;
			
	case PLAYER_AMY:
		sprite_index = spr_gui_continue_amy;
	break;
	
	case PLAYER_SUKA:
		sprite_index = spr_gui_continue_suka;
	break;
	
	case PLAYER_KAT:
		sprite_index = spr_gui_continue_kat;
	break;
	
	case PLAYER_MILA:
		sprite_index = spr_gui_continue_mila;
	break;
	
	case PLAYER_EGG:
		sprite_index = spr_gui_continue_egg;
	break;
}
	
ani_start(sprite_index, 20);