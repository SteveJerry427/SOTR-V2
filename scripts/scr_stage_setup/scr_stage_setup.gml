/// @function scr_stage_setup
function scr_stage_setup()
{
	var _animal_array =
	[                                        
		spr_obj_animal_cucky, spr_obj_animal_flicky, spr_obj_animal_pecky, spr_obj_animal_picky,
		spr_obj_animal_pocky, spr_obj_animal_ricky, spr_obj_animal_rocky
	];
	
	/// @method m_local_random_animals
	var m_local_random_animals = function(_animals)
	{
		var _length = array_length(_animals) - 1;
	    var _a1 = irandom(_length);
	    var _a2 = irandom(_length);
		
		while _a2 == _a1
		{
		    _a2 = irandom(_length);
		}
		
		return [_animals[_a1], _animals[_a2]];
	}
	
	// Stage setup
	switch room
	{
		case rm_stage_tsz0:
		
			m_stage_set(0, "TECH STADIUM", ACT_SINGLE, bgm_woofle, m_local_random_animals(_animal_array), 1024, 1536, rm_devmenu, true);
			
			player_spawn(112, 896, global.player_main, "Objects");
			player_spawn(96, 896, global.player_cpu, "Objects");
			
			var _bg_dist = dist_get_data(EFFECTDATA.LZBG);
			var _fg_dist = dist_get_data(EFFECTDATA.LZFG);
			
			dist_set_fg([], _fg_dist, -0.5, 0, room_height, ["GraphicsA", "AssetsA", "GraphicsB", "AssetsB"]);
			dist_set_bg(_bg_dist, _bg_dist, -0.25, 192, 348);

			pal_load(spr_pal_tsz_primary, spr_pal_tsz_secondary);
			collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");

			ani_add_sprite(spr_tsz_asset_flower, 12);
			
			// Background
			
			bg_add_layer(spr_tsz_bg_layer0, 0, 72, 0, 0, 0, 0, 0.350, 0);				// Far Horizon
			bg_set_perspective_x(0.200, 8);
			bg_add_layer(spr_tsz_bg_layer0, 72,  120, 72,  0,  0, 0, 0.225, 0);			// Far Buildings
			bg_add_layer(spr_tsz_bg_layer0, 192, 116, 192, 0,  0, 0, 0.275, 0);			// Far Mechanical Stuff
			bg_add_layer(spr_tsz_bg_layer0, 308, 8, 308, 0, 0, 0, 0.245, 0);			// Bottom Lights
			bg_set_perspective_x(0.315, 2);
			bg_add_layer(spr_tsz_bg_layer0, 316, 32, 316, 0, 0, 0, 0.345, 0);			// Bottom Tubes
			bg_set_perspective_x(0.750, 8);
			bg_add_layer(spr_tsz_bg_layer1, 0,   32,  0,   0, -0.10,  0, 0.375, 0);		// Discs 1
			bg_add_layer(spr_tsz_bg_layer1, 32,  32,  32,  0, -0.025, 0, 0.340, 0);		// Discs 2
			bg_add_layer(spr_tsz_bg_layer1, 80,  112, 80,  0,  0,     0, 0.300, 0);		// Close Buildings
			bg_add_layer(spr_tsz_bg_layer1, 208, 96,  208, 0,  0,     0, 0.345, 0);		// Close Mechanical Stuff	
			bg_add_layer(spr_tsz_bg_layer2, 0, 128, 192, 0, 0, 0, 0.300, 0);			// Water Layer
			bg_set_perspective_x(1.0, 2);
			bg_set_perspective_y(water_level_init);
			
		break;
		
		case rm_stage_ccz:
		
		m_stage_set(1, "COLLISION CANVAS", ACT_SINGLE, bgm_ccz_hulahoop, m_local_random_animals(_animal_array), 2000, -1, rm_stage_nlz1, true);
		
		player_spawn(100, 1504, global.player_main, "Objects");
		player_spawn(70, 1504, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_ccz_bg_layer0, 0, 320, -100, 0, 0, 0, 0, 0);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_ccz_bg_layer1, 0, 140, 0 , 0, -0.10, 0, 0.025, 0.01);	
			bg_add_layer(spr_ccz_bg_layer1, 140, 210, 140, 0, -0.2, 0, 0.05, 0.02);	
			bg_set_perspective_x(0.05, 0);
			bg_add_layer(spr_ccz_bg_layer2, 0, 320, -16, 0, 0, 0, 0.075, 0.02);				
			bg_set_perspective_x(0.075, 0);
			bg_add_layer(spr_ccz_bg_layer3, 0, 320, 0, 0, 0, 0, 0.1, 0.03);				
			bg_set_perspective_x(0.1, 0);
			bg_add_layer(spr_ccz_bg_layer4, 0, 320, 0, 0, 0, 0, 0.1, 0.03);				
			bg_set_perspective_x(0.1, 0);
			bg_add_layer(spr_ccz_bg_layer5, 0, 320, 0, 0, 0, 0, 0.2, 0.04);				
			bg_set_perspective_x(0.2, 0);
			bg_add_layer(spr_ccz_bg_layer6, 0, 320, 0, 0, 0, 0, 0.3, 0.05);				
			bg_set_perspective_x(0.3, 0);
			bg_add_layer(spr_ccz_bg_layer7, 0, 320, 32, 0, 0, 0, 0.5, 0.06);				
			bg_set_perspective_x(0.5, 0);
			bg_add_layer(spr_ccz_bg_layer8, 0, 320, 72, 0, 0, 0, 0.7, 0.07);				
			bg_set_perspective_x(0.7, 0);
		
		break;
		
		case rm_stage_nlz1:
		
		m_stage_set(2, "NEVER LAKE", 0, bgm_nlz1_bb8, m_local_random_animals(_animal_array), 2000, -1, rm_stage_nlz2, true);
		
		player_spawn(100, 1088, global.player_main, "Objects");
		player_spawn(70, 1088, global.player_cpu, "Objects");
		
		    var _bg_dist = dist_get_data(EFFECTDATA.LZBG);
			var _fg_dist = dist_get_data(EFFECTDATA.LZFG);
			
			dist_set_fg([], _fg_dist, -0.5, 0, room_height, ["GraphicsA", "AssetsA", "GraphicsB", "AssetsB"]);
			dist_set_bg(_bg_dist, _bg_dist, -0.25, 192, 348);
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_nlz1_bg_layer0, 0, 375, -32, 0, 0, 0, 0, 0.050);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_nlz1_bg_layer1, 0, 375, 0, 0, -0.075, 0, 0.01, 0.050);				
			bg_set_perspective_x(0.01, 0);
			bg_add_layer(spr_nlz1_bg_layer2, 0, 375, 0, 0, 0, 0, 0.02, 0.055);				
			bg_set_perspective_x(0.02, 0);
			bg_add_layer(spr_nlz1_bg_layer3, 0, 375, 0, 0, -0.125, 0, 0.05, 0.060);				
			bg_set_perspective_x(0.05, 0);
			bg_add_layer(spr_nlz1_bg_layer4, 0, 375, 13, 0, 0, 0, 0.04, 0.065);				
			bg_set_perspective_x(0.04, 0);
			bg_add_layer(spr_nlz1_bg_layer5, 0, 375, 13, 0, 0, 0, 0.05, 0.070);				
			bg_set_perspective_x(0.05, 0);
			bg_add_layer(spr_nlz1_bg_layer6, 0, 375, 15, 0, 0, 0, 0.075, 0.075);				
			bg_set_perspective_x(0.075, 0);
			bg_add_layer(spr_nlz1_bg_layer7, 0, 375, 15, 0, 0, 0, 0.1, 0.080);				
			bg_set_perspective_x(0.1, 0);
			bg_add_layer(spr_nlz1_bg_layer8, 0, 375, 23, 0, 0, 0, 0.125, 0.09);				
			bg_set_perspective_x(0.125, 0);
			bg_add_layer(spr_nlz1_bg_layer9, 0, 375, 23, 0, -0.1, 0, 0.15, 0.09);
			bg_set_perspective_x(0.15, 2);
			bg_add_layer(spr_nlz1_bg_layer10, 0, 375, 26, 0, 0, 0, 0.175, 0.1);				
			bg_set_perspective_x(0.175, 0);
			bg_add_layer(spr_nlz1_bg_layer11, 0, 375, 51, 0, 0, 0, 0.20, 0.1125);				
			bg_set_perspective_x(0.20, 0);
			bg_add_layer(spr_nlz1_bg_layer12, 0, 375, 71, 0, 0, 0, 0.225, 0.125);				
			bg_set_perspective_x(0.225, 0);
			bg_add_layer(spr_nlz1_bg_layer13, 0, 375, 156, 0, 0, 0, 0.25, 0.15);				
			bg_set_perspective_x(0.25, 0);
			bg_add_layer(spr_nlz1_bg_layer14, 0, 375, 201, 0, 0, 0, 0.30, 0.20);				
			bg_set_perspective_x(0.30, 0);
		
		break;
		
			
		case rm_stage_nlz2:
		
		m_stage_set(3, "NEVER LAKE", 1, bgm_nlz2_foreverinyourmind, m_local_random_animals(_animal_array), 2496, 2000, rm_stage_ssz1, true);
		
		player_spawn(0, 258, global.player_main, "Objects");
		player_spawn(0, 258, global.player_cpu, "Objects");
		
		    var _bg_dist = dist_get_data(EFFECTDATA.LZBG);
			var _fg_dist = dist_get_data(EFFECTDATA.LZFG);
			
			dist_set_fg([], _fg_dist, -0.5, 0, room_height, ["GraphicsA", "AssetsA", "GraphicsB", "AssetsB"]);
			dist_set_bg(_bg_dist, _bg_dist, -0.25, 192, 348);
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_nlz1_bg_layer0, 0, 375, -64, 0, 0, 0, 0, 0.050);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_nlz1_bg_layer3, 0, 375, -48, 0, -0.2, 0, 0.02, 0.060);				
			bg_set_perspective_x(0.02, 0);
			bg_add_layer(spr_nlz1_bg_layer4, 0, 375, -96, 0, 0, 0, 0.04, 0.010);				
			bg_set_perspective_x(0.04, 0);
			bg_add_layer(spr_nlz2_bg_layer3, 0, 400, 16, 0, 0, 0, 0.06, 0.015);				
			bg_set_perspective_x(0.06, 0);
			bg_add_layer(spr_nlz2_bg_layer4, 0, 400, 16, 0, 0, 0, 0.08, 0.020);				
			bg_set_perspective_x(0.08, 0);
			bg_add_layer(spr_nlz2_bg_layer5, 0, 400, 16, 0, 0, 0, 0.10, 0.025);				
			bg_set_perspective_x(0.10, 0);
			bg_add_layer(spr_nlz2_bg_layer6, 0, 400, 16, 0, 0, 0, 0.12, 0.035);	
			bg_set_perspective_x(0.12, 0);
			bg_add_layer(spr_nlz2_bg_layer7, 0, 400, 0, 0, 0, 0, 0.16, 0.040);	
			bg_set_perspective_x(0.16, 0);
			bg_add_layer(spr_nlz2_bg_layer8, 0, 400, 0, 0, 0, 0, 0.18, 0.050);	
			bg_set_perspective_x(0.18, 0);
			bg_add_layer(spr_nlz2_bg_layer9, 0, 400, 0, 0, 0, 0, 0.20, 0.060);	
			bg_set_perspective_x(0.20, 0);
			bg_add_layer(spr_nlz2_bg_layer10, 0, 400, 0, 0, 0, 0, 0.22, 0.075);	
			bg_set_perspective_x(0.22, 0);
			bg_add_layer(spr_nlz2_bg_layer11, 0, 400, 4, 0, 0, 0, 0.24, 0.075);	
			bg_set_perspective_x(0.24, 0);
			bg_add_layer(spr_nlz2_bg_layer12, 0, 400, 0, 0, 0, 0, 0.26, 0.075);	
			bg_set_perspective_x(0.26, 0);
			bg_add_layer(spr_nlz2_bg_layer13, 0, 400, 0, 0, 0, 0, 0.30, 0.075);	
			bg_set_perspective_x(0.30, 0);
			bg_add_layer(spr_nlz2_bg_layer14, 0, 400, 64, 0, 0, 0, 0.40, 0.075);	
			bg_set_perspective_x(0.40, 0);
			bg_add_layer(spr_nlz2_bg_layer15, 0, 144, 288, 0, -0.3, 0, 0.300, 0);
			bg_set_perspective_x(0.75, 2);
			bg_set_perspective_y(water_level_init);
		break;
		

		
		
		case rm_stage_ssz1:
		
		m_stage_set(4, "SKYLINE SQUARE", 0, bgm_ssz1alt_wearefree, m_local_random_animals(_animal_array), 2000, -1, rm_stage_ssz2, false);
		
		player_spawn(5, 624, global.player_main, "Objects");
		player_spawn(5, 624, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_ssz1_bg_layer0, 0, 400, 0, 0, 0, 0, 0, 0.050);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_ssz1_bg_layer0_5, 0, 400, 0, 0, 0, 0, 0.01, 0.055);				
			bg_set_perspective_x(0.01, 0);
			bg_add_layer(spr_ssz1_bg_layer1_and_2, 0, 32, 0, 0, -0.050, 0, 0.02, 0.052);	
			bg_add_layer(spr_ssz1_bg_layer1_and_2, 32, 48, 32, 0, -0.1, 0, 0.02, 0.054);	
			bg_add_layer(spr_ssz1_bg_layer1_and_2, 80, 64, 80, 0, -0.150, 0, 0.02, 0.056);	
			bg_add_layer(spr_ssz1_bg_layer1_and_2, 144, 256, 144, 0, -0.2, 0, 0.03, 0.056);
			bg_set_perspective_x(0.03, 0);
			bg_add_layer(spr_ssz1_bg_layer3, 0, 400, -48, 0, 0, 0, 0.04, 0.050);				
			bg_set_perspective_x(0.04, 0);
			bg_add_layer(spr_ssz1_bg_layer4, 0, 400, -48, 0, -0.095, 0, 0.06, 0.060);				
			bg_set_perspective_x(0.06, 0);
			bg_add_layer(spr_ssz1_bg_layer5, 0, 400, -32, 0, 0, 0, 0.08, 0.070);				
			bg_set_perspective_x(0.08, 0);
			bg_add_layer(spr_ssz1_bg_layer6, 0, 256, -34, 0, -1.5, 0, 0.10, 0.080);
			bg_add_layer(spr_ssz1_bg_layer6, 256, 144, 224, 0, 1.75, 0, 0.10, 0.085);
			bg_set_perspective_x(0.10, 0);
			bg_add_layer(spr_ssz1_bg_layer7, 0, 400, 0, 0, 0, 0, 0.15, 0.090);				
			bg_set_perspective_x(0.15, 0);
			bg_add_layer(spr_ssz1_bg_layer8, 0, 400, 0, 0, -2.5, 0, 0.20, 0.090);				
			bg_set_perspective_x(0.20, 0);
			bg_add_layer(spr_ssz1_bg_layer9, 0, 272, 0, 0, 3, 0, 0.20, 0.090);
			bg_add_layer(spr_ssz1_bg_layer9, 272, 128, 271, 0, 0, 0, 0.20, 0.090);
			bg_set_perspective_x(0.20, 0);
			bg_add_layer(spr_ssz1_bg_layer10, 0, 400, 40, 0, 0, 0, 0.25, 0.11);				
			bg_set_perspective_x(0.25, 0);
			bg_add_layer(spr_ssz1_bg_layer12, 0, 400, 80, 0, 0, 0, 0.35, 0.15);				
			bg_set_perspective_x(0.35, 0);
			bg_add_layer(spr_ssz1_bg_layer14, 0, 400, 176, 0, -0.6, 0, 0.4, 0.175);				
			bg_set_perspective_x(0.4, 0);
			bg_add_layer(spr_ssz1_bg_layer13, 0, 64, 352, 0, -4, 0, 0.4, 0.15);
			bg_add_layer(spr_ssz1_bg_layer13, 64, 64, 384, 0, -5, 0, 0.4, 0.15);
			bg_add_layer(spr_ssz1_bg_layer13, 128, 64, 416, 0, 4, 0, 0.4, 0.15);	
			bg_add_layer(spr_ssz1_bg_layer13, 192, 64, 448, 0, 5, 0, 0.4, 0.15);
			bg_set_perspective_x(0.4, 0);
			bg_add_layer(spr_ssz1_bg_layer14, 0, 400, 264, 0, -0.5, 0, 0.45, 0.20);				
			bg_set_perspective_x(0.45, 0);
			
		break;
		
			case rm_stage_ssz2:
		
		m_stage_set(5, "SKYLINE SQUARE", 1, bgm_ssz2_loveyousonic, m_local_random_animals(_animal_array), 2880, -1, rm_stage_blz1, true);
		
		player_spawn(20, 1374, global.player_main, "Objects");
		player_spawn(20, 1374, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_ssz2_bg_layer0, 0, 16, 0, 0, 0, 0, 0.009, 0.050);	
			bg_add_layer(spr_ssz2_bg_layer0, 16, 16, 16, 0, 0, 0, 0.008, 0.050);		
			bg_add_layer(spr_ssz2_bg_layer0, 32, 16, 32, 0, 0, 0, 0.007, 0.050);
			bg_add_layer(spr_ssz2_bg_layer0, 48, 16, 48, 0, 0, 0, 0.006, 0.050);
			bg_add_layer(spr_ssz2_bg_layer0, 64, 16, 64, 0, 0, 0, 0.005, 0.050);
			bg_add_layer(spr_ssz2_bg_layer0, 80, 720, 80, 0, 0, 0, 0.004, 0.050);
			bg_set_perspective_x(0.004, 16);
			bg_add_layer(spr_ssz2_bg_layer1, 0, 1280, 0, 0, 0, 0, 0.01, 0.055);				
			bg_set_perspective_x(0.01, 0);
			bg_add_layer(spr_ssz2_bg_layer2, 0, 32, 0, 0, -0.050, 0, 0.02, 0.052);	
			bg_add_layer(spr_ssz2_bg_layer2, 32, 48, 32, 0, -0.1, 0, 0.02, 0.054);	
			bg_add_layer(spr_ssz2_bg_layer2, 80, 64, 80, 0, -0.150, 0, 0.02, 0.056);	
			bg_add_layer(spr_ssz2_bg_layer2, 144, 256, 144, 0, -0.2, 0, 0.03, 0.056);
			bg_set_perspective_x(0.03, 0);
			bg_add_layer(spr_ssz2_bg_layer3, 0, 400, -48, 0, 0, 0, 0.04, 0.050);				
			bg_set_perspective_x(0.04, 0);
			bg_add_layer(spr_ssz2_bg_layer4, 0, 400, -48, 0, -0.095, 0, 0.06, 0.060);				
			bg_set_perspective_x(0.06, 0);
			bg_add_layer(spr_ssz2_bg_layer5, 0, 1280, -32, 0, 0, 0, 0.08, 0.070);				
			bg_set_perspective_x(0.08, 0);
			bg_add_layer(spr_ssz2_bg_layer6, 0, 16, 736, 0, -1.5, 0, 0.10, 0.080);
			bg_add_layer(spr_ssz2_bg_layer6, 16, 16, 624, 0, 1.75, 0, 0.10, 0.085);
			bg_set_perspective_x(0.10, 0);
			bg_add_layer(spr_ssz2_bg_layer7, 0, 960, 0, 0, 0, 0, 0.15, 0.090);				
			bg_set_perspective_x(0.15, 0);
			bg_add_layer(spr_ssz2_bg_layer8, 0, 352, -64, 0, 0.1, 0, 0.175, 0.090);				
			bg_set_perspective_x(0.175, 0);
			bg_add_layer(spr_ssz2_bg_layer9, 0, 400, 0, 0, -2.5, 0, 0.20, 0.090);				
			bg_set_perspective_x(0.20, 0);
			bg_add_layer(spr_ssz2_bg_layer10, 0, 272, 0, 0, 3, 0, 0.20, 0.090);
			bg_add_layer(spr_ssz2_bg_layer10, 272, 128, 271, 0, 0, 0, 0.20, 0.090);
			bg_set_perspective_x(0.20, 0);
			bg_add_layer(spr_ssz2_bg_layer11, 0, 960, 40, 0, 0, 0, 0.25, 0.11);				
			bg_set_perspective_x(0.25, 0);
			bg_add_layer(spr_ssz2_bg_layer12, 0, 384, 40, 0, 0.2, 0, 0.30, 0.11);				
			bg_set_perspective_x(0.30, 0);
			bg_add_layer(spr_ssz2_bg_layer13, 0, 960, 80, 0, 0, 0, 0.35, 0.15);				
			bg_set_perspective_x(0.35, 0);
			bg_add_layer(spr_ssz2_bg_layer14, 0, 1280, 80, 0, -5, 0, 0.35, 0.175);				
			bg_set_perspective_x(0.35, 0);
			bg_add_layer(spr_ssz2_bg_layer15, 0, 784, 80, 0, 6, 0, 0.4, 0.175);
			bg_add_layer(spr_ssz2_bg_layer15, 784, 496, 864, 0, 0, 0, 0.4, 0.175);
			bg_set_perspective_x(0.4, 0);
			bg_add_layer(spr_ssz2_bg_layer16, 0, 1280, 138, 0, 0, 0, 0.5, 0.20);				
			bg_set_perspective_x(0.5, 0);
			bg_add_layer(spr_ssz2_bg_layer17, 0, 1280, 138, 0, 0, 0, 0.6, 0.20);				
			bg_set_perspective_x(0.6, 0);
			bg_add_layer(spr_ssz2_bg_layer18, 0, 64, 1304, 0, -4, 0, 0.4, 0.20);
			bg_add_layer(spr_ssz2_bg_layer18, 64, 64, 1316, 0, -5, 0, 0.4, 0.20);
			bg_add_layer(spr_ssz2_bg_layer18, 128, 64, 1328, 0, 4, 0, 0.4, 0.20);	
			bg_add_layer(spr_ssz2_bg_layer18, 192, 64, 1336, 0, 5, 0, 0.4, 0.20);
			bg_set_perspective_x(0.4, 0);
			bg_add_layer(spr_ssz2_bg_layer19, 0, 960, 176, 0, -0.6, 0, 0.4, 0.175);				
			bg_set_perspective_x(0.4, 0);
			bg_add_layer(spr_ssz2_bg_layer20, 0, 800, 248, 0, -0.5, 0, 0.45, 0.20);				
			bg_set_perspective_x(0.45, 0);
			
		break;
		
		case rm_stage_blz1:
		
		m_stage_set(6, "BRIDGE LAGOON", 0, bgm_blz1_BIZ1JX16bit, m_local_random_animals(_animal_array), 2000, -1, rm_stage_blz2, true);
		
		player_spawn(100, 624, global.player_main, "Objects");
		player_spawn(70, 624, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_blz1_bg_layer0, 0, 400, -60, 0, 0, 0, 0, 0.025);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_blz1_bg_layer1, 0, 32, -8, 0, -0.02, 0, 0.02, 0.025);
			bg_add_layer(spr_blz1_bg_layer1, 32, 64, 8, 0, -0.04, 0, 0.04, 0.025);
			bg_add_layer(spr_blz1_bg_layer1, 96, 64, 48, 0, -0.06, 0, 0.06, 0.025);
			bg_set_perspective_x(0.06, 0);
			bg_add_layer(spr_blz1_bg_layer2, 0, 400, -60, 0, -0.07, 0, 0.03, 0.03);				
			bg_set_perspective_x(0.07, 0);
			bg_add_layer(spr_blz1_bg_layer3, 0, 400, -60, 0, 0, 0, 0.06, 0.03);				
			bg_set_perspective_x(0.06, 0);
			bg_add_layer(spr_blz1_bg_layer4, 0, 272, -60, 0, 0, 0, 0.08, 0.03);
			bg_add_layer(spr_blz1_bg_layer4, 272, 16, 212, 0, 0, 0, 0.10, 0.03);
			bg_add_layer(spr_blz1_bg_layer4, 288, 16, 228, 0, 0, 0, 0.15, 0.03);
			bg_add_layer(spr_blz1_bg_layer4, 304, 16, 244, 0, 0, 0, 0.175, 0.03);
			bg_add_layer(spr_blz1_bg_layer4, 320, 16, 260, 0, 0, 0, 0.2, 0.03);
			bg_add_layer(spr_blz1_bg_layer4, 336, 16, 276, 0, 0, 0, 0.225, 0.03);
			bg_add_layer(spr_blz1_bg_layer4, 352, 16, 292, 0, 0, 0, 0.25, 0.03);
			bg_add_layer(spr_blz1_bg_layer4, 368, 16, 308, 0, 0, 0, 0.275, 0.03);
			bg_add_layer(spr_blz1_bg_layer4, 384, 16, 324, 0, 0, 0, 0.30, 0.03);
			bg_set_perspective_x(0.30, 0);
			bg_add_layer(spr_blz1_bg_layer5, 0, 400, -60, 0, 0, 0, 0.1, 0.03);				
			bg_set_perspective_x(0.1, 0);
			bg_add_layer(spr_blz1_bg_layer6, 0, 400, -60, 0, 0, 0, 0.15, 0.03);				
			bg_set_perspective_x(0.15, 0);
			bg_add_layer(spr_blz1_bg_layer7, 0, 400, -60, 0, 0, 0, 0.2, 0.03);				
			bg_set_perspective_x(0.2, 0);
			bg_add_layer(spr_blz1_bg_layer8, 0, 400, -60, 0, 0, 0, 0.25, 0.03);				
			bg_set_perspective_x(0.25, 0);
		
		break;
		
		case rm_stage_blz2:
		
		m_stage_set(7, "BRIDGE LAGOON", 1, bgm_blz2_LCZ1JX16bit, m_local_random_animals(_animal_array), 3000, 1500, rm_devmenu, true);
		
		player_spawn(100, 1056, global.player_main, "Objects");
		player_spawn(70, 1056, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		break;
		
		case rm_stage_bpz1:
		
		m_stage_set(8, "BLOCKSIDE PARK", 0, bgm_bpz1_maze1, m_local_random_animals(_animal_array), 1500, -1, rm_stage_bpz2, true);
		
		player_spawn(100, 1376, global.player_main, "Objects");
		player_spawn(70, 1376, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_bpz1_bg_layer0, 0, 320, 0, 0, 0, 0, 0, 0.02);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_bpz1_bg_layer1, 0, 32, 16, 0, -0.08, 0, 0.025, 0.04);		
			bg_add_layer(spr_bpz1_bg_layer1, 32, 218, 48, 0, -0.12, 0, 0.025, 0.04);	
			bg_set_perspective_x(0.025, 0);
			bg_add_layer(spr_bpz1_bg_layer2, 0, 320, -32, 0, 0, 0, 0.050, 0.05);				
			bg_set_perspective_x(0.050, 0);
			bg_add_layer(spr_bpz1_bg_layer3, 0, 320, -16, 0, 0, 0, 0.060, 0.06);				
			bg_set_perspective_x(0.060, 0);
			bg_add_layer(spr_bpz1_bg_layer4, 0, 320, -16, 0, 0, 0, 0.065, 0.07);				
			bg_set_perspective_x(0.065, 0);
			bg_add_layer(spr_bpz1_bg_layer5, 0, 320, -16, 0, -0.05, 0, 0.080, 0.07);				
			bg_set_perspective_x(0.080, 0);
			bg_add_layer(spr_bpz1_bg_layer6, 0, 320, 0, 0, 0, 0, 0.1, 0.08);				
			bg_set_perspective_x(0.1, 0);
			bg_add_layer(spr_bpz1_bg_layer7, 0, 320, 16, 0, 0, 0, 0.150, 0.09);				
			bg_set_perspective_x(0.150, 0);
			bg_add_layer(spr_bpz1_bg_layer8, 0, 320, 32, 0, 0, 0, 0.2, 0.1);				
			bg_set_perspective_x(0.2, 0);
			bg_add_layer(spr_bpz1_bg_layer9, 0, 320, 48, 0, 0, 0, 0.3, 0.1);				
			bg_set_perspective_x(0.3, 0);
			bg_add_layer(spr_bpz1_bg_layer10, 0, 320, 96, 0, 0, 0, 0.3, 0.1);				
			bg_set_perspective_x(0.3, 0);
		
		break;
		
		case rm_stage_bpz2:
		
		m_stage_set(9, "BLOCKSIDE PARK", 1, bgm_bpz2_maze2, m_local_random_animals(_animal_array), 2000, 1500, rm_stage_sgz1, true);
		
		player_spawn(10, 352, global.player_main, "Objects");
		player_spawn(10, 352, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		break;
		
			case rm_stage_sgz1:
		
		m_stage_set(10, "SPRING GARDENS", 0, bgm_sgz1_springsend, m_local_random_animals(_animal_array), 2960, -1, rm_stage_sgz2, true);
		
		player_spawn(25, 2928, global.player_main, "Objects");
		player_spawn(25, 2928, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_sgz1_bg_layer0, 0, 560, -64, 0, 0, 0, 0, 0.01);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_sgz1_bg_layer1, 0, 48, 0, 0, -0.02, 0, 0, 0.01);
			bg_add_layer(spr_sgz1_bg_layer1, 48, 512, 48, 0, -0.04, 0, 0, 0.015);
			bg_set_perspective_x(0.015, 0);
			bg_add_layer(spr_sgz1_bg_layer2, 0, 560, -48, 0, 0, 0, 0.01, 0.02);				
			bg_set_perspective_x(0.01, 0);
			bg_add_layer(spr_sgz1_bg_layer3, 0, 560, -32, 0, 0, 0, 0.03, 0.03);				
			bg_set_perspective_x(0.03, 0);
			bg_add_layer(spr_sgz1_bg_layer4, 0, 560, -16, 0, 0, 0, 0.05, 0.04);				
			bg_set_perspective_x(0.05, 0);
			bg_add_layer(spr_sgz1_bg_layer5, 0, 560, 0, 0, 0, 0, 0.1, 0.05);				
			bg_set_perspective_x(0.1, 0);
			bg_add_layer(spr_sgz1_bg_layer6, 0, 560, 16, 0, 0, 0, 0.15, 0.06);				
			bg_set_perspective_x(0.15, 0);
			bg_add_layer(spr_sgz1_bg_layer7, 0, 560, 32, 0, 0, 0, 0.2, 0.07);				
			bg_set_perspective_x(0.2, 0);
			bg_add_layer(spr_sgz1_bg_layer8, 0, 560, 48, 0, 0, 0, 0.25, 0.08);				
			bg_set_perspective_x(0.25, 0);
			bg_add_layer(spr_sgz1_bg_layer9, 0, 560, 64, 0, 0, 0, 0.3, 0.09);				
			bg_set_perspective_x(0.3, 0);
			bg_add_layer(spr_sgz1_bg_layer10, 0, 560, 224, 0, 0, 0, 0.25, 0.2);				
			bg_set_perspective_x(0.25, 0);
			bg_add_layer(spr_sgz1_bg_layer11, 0, 560, 240, 0, -1.5, 0, 0.3, 0.2);				
			bg_set_perspective_x(0.3, 0);
			bg_add_layer(spr_sgz1_bg_layer12, 0, 560, 240, 0, 0, 0, 0.35, 0.2);				
			bg_set_perspective_x(0.35, 0);
			bg_add_layer(spr_sgz1_bg_layer13, 0, 560, 256, 0, 3, 0, 0.4, 0.2);				
			bg_set_perspective_x(0.4, 0);
			bg_add_layer(spr_sgz1_bg_layer14, 0, 560, 256, 0, 0, 0, 0.45, 0.2);				
			bg_set_perspective_x(0.45, 0);
			bg_add_layer(spr_sgz1_bg_layer16, 0, 560, 208, 0, 0, 0, 0.5, 0.2);				
			bg_set_perspective_x(0.5, 0);
		
		break;
			
			case rm_stage_sgz2:
		
		m_stage_set(11, "SPRING GARDENS", 1, bgm_sgz2_midnightgreenhousermx, m_local_random_animals(_animal_array), 4000, 2975, rm_devmenu, true);
		
		player_spawn(100, 1744, global.player_main, "Objects");
		player_spawn(70, 1744, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_sgz2_bg_layer0, 0, 560, 0, 0, 0, 0, 0, 0.001);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_sgz2_bg_layer1, 0, 560, 0, 0, 0, 0, 0.01, 0.001);				
			bg_set_perspective_x(0.01, 0);
			bg_add_layer(spr_sgz2_bg_layer2, 0, 560, 0, 0, 0, 0, 0.02, 0.001);				
			bg_set_perspective_x(0.02, 0);
			bg_add_layer(spr_sgz2_bg_layer3, 0, 560, 0, 0, 0, 0, 0, 0.001);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_sgz2_bg_layer4, 0, 560, 0, 0, 0, 0, 0.05, 0.001);				
			bg_set_perspective_x(0.05, 0);
			bg_add_layer(spr_sgz2_bg_layer5, 0, 560, 0, 0, 0, 0, 0.075, 0.001);				
			bg_set_perspective_x(0.075, 0);
			bg_add_layer(spr_sgz2_bg_layer6, 0, 560, 0, 0, 0, 0, 0.1, 0.001);				
			bg_set_perspective_x(0.1, 0);
			bg_add_layer(spr_sgz2_bg_layer7, 0, 560, 0, 0, 0, 0, 0.15, 0.001);				
			bg_set_perspective_x(0.15, 0);
			bg_add_layer(spr_sgz2_bg_layer8, 0, 800, 0, 0, 0, 0, 0.2, 0.001);				
			bg_set_perspective_x(0.2, 0);
			bg_add_layer(spr_sgz2_bg_layer9, 0, 800, 0, 0, 0, 0, 0.25, 0.001);				
			bg_set_perspective_x(0.25, 0);
			bg_add_layer(spr_sgz2_bg_layer10, 0, 800, 0, 0, 0, 0, 0.3, 0.001);				
			bg_set_perspective_x(0.3, 0);
			bg_add_layer(spr_sgz2_bg_layer11, 0, 800, 0, 0, 0, 0, 0.35, 0.001);				
			bg_set_perspective_x(0.35, 0);
			bg_add_layer(spr_sgz2_bg_layer12, 0, 800, 0, 0, 0, 0, 0.4, 0.001);				
			bg_set_perspective_x(0.4, 0);
			bg_add_layer(spr_sgz2_bg_layer13fyactal, 0, 800, 0, 0, 0, 0, 0.45, 0.001);				
			bg_set_perspective_x(0.45, 0);
			bg_add_layer(spr_sgz2_bg_layer14, 0, 800, 0, 0, 0, 0, 0.5, 0.001);				
			bg_set_perspective_x(0.5, 0);
			bg_add_layer(spr_sgz2_bg_layer15, 0, 800, 0, 0, 0, 0, 0.55, 0.001);				
			bg_set_perspective_x(0.55, 0);
			bg_add_layer(spr_sgz2_bg_layer18, 0, 176, 692, 0, -0.3, 0, 0.6, 0.001);
			bg_set_perspective_x(0.75, 2);
			bg_set_perspective_y(water_level_init);
		break;
		
				case rm_stage_ddz1:
		
		m_stage_set(12, "DAWNBREAK DRIVE", 0, bgm_ddz1_searchformydreams, m_local_random_animals(_animal_array), 2500, -1, rm_devmenu, true);
		
		player_spawn(100, 624, global.player_main, "Objects");
		player_spawn(70, 624, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		break;
		
			case rm_stage_ddz2:
		
		m_stage_set(12, "DAWNBREAK DRIVE", 1, bgm_ddz2_searchformydreamsrmx, m_local_random_animals(_animal_array), 2000, -1, rm_devmenu, true);
		
		player_spawn(0, 1312, global.player_main, "Objects");
		player_spawn(0, 1312, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_ooz_bg_layer0, 0, 16, 0, 0, 0, 0, 0.06, 0.05);
			bg_add_layer(spr_ooz_bg_layer0, 16, 16, 16, 0, 0, 0, 0.05, 0.05);			
			bg_add_layer(spr_ooz_bg_layer0, 32, 16, 32, 0, 0, 0, 0.04, 0.05);			
			bg_add_layer(spr_ooz_bg_layer0, 48, 272, 48, 0, 0, 0, 0.03, 0.05);			
			bg_set_perspective_x(0.03, 16);
			bg_add_layer(spr_ooz_bg_layer1, 0, 320, 40, 0, -0.025, 0, 0.05, 0.07);				
			bg_set_perspective_x(0.05, 0);
			bg_add_layer(spr_ooz_bg_layer2, 0, 320, 0, 0, -0.06, 0, 0.04, 0.06);				
			bg_set_perspective_x(0.04, 0);
			bg_add_layer(spr_ooz_bg_layer3, 0, 320, 40, 0, 0, 0, 0.05, 0.07);				
			bg_set_perspective_x(0.05, 0);
			bg_add_layer(spr_ooz_bg_layer4, 0, 320, 120, 0, 0, 0, 0, 0.07);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_ooz_bg_layer5, 0, 320, 80, 0, 0, 0, 0.125, 0.08);				
			bg_set_perspective_x(0.125, 0);
			bg_add_layer(spr_ooz_bg_layer6, 0, 320, 96, 0, 0, 0, 0.175, 0.085);				
			bg_set_perspective_x(0.175, 0);
			bg_add_layer(spr_ooz_bg_layer7, 0, 320, 96, 0, 0, 0, 0.2, 0.09);				
			bg_set_perspective_x(0.2, 0);
			bg_add_layer(spr_ooz_bg_layer8, 0, 320, 112, 0, 0, 0, 0.25, 0.095);				
			bg_set_perspective_x(0.25, 0);
			bg_add_layer(spr_ooz_bg_layer9, 0, 320, 160, 0, 0, 0, 0.3, 0.1);				
			bg_set_perspective_x(0.3, 0);
		
		break;
		
			case rm_stage_aiz1:
		
		m_stage_set(13, "AURORA ICEFIELD", 0, bgm_aiz2_fairyofaif, m_local_random_animals(_animal_array), 2000, -1, rm_devmenu, true);
		
		player_spawn(100, 1808, global.player_main, "Objects");
		player_spawn(70, 1808, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_aiz1_bg_layer0, 0, 16, 0, 0, 0, 0, 0.04, 0.025);
			bg_add_layer(spr_aiz1_bg_layer0, 16, 16, 16, 0, 0, 0, 0.03, 0.025);			
			bg_add_layer(spr_aiz1_bg_layer0, 32, 16, 32, 0, 0, 0, 0.02, 0.025);			
			bg_add_layer(spr_aiz1_bg_layer0, 48, 352, 48, 0, 0, 0, 0.01, 0.025);			
			bg_set_perspective_x(0.03, 16);
			bg_add_layer(spr_aiz1_bg_layer1, 0, 400, 0, 0, 0, 0, 0.0175, 0.010);				
			bg_set_perspective_x(0.0175, 0);
			bg_add_layer(spr_aiz1_bg_layer2, 0, 400, 0, 0, 0, 0, 0.015, 0.015);				
			bg_set_perspective_x(0.015, 0);
			bg_add_layer(spr_aiz1_bg_layer3, 0, 400, 0, 0, 0, 0, 0.025, 0.020);				
			bg_set_perspective_x(0.025, 0);
			bg_add_layer(spr_aiz1_bg_layer4, 0, 400, 0, 0, 0, 0, 0.015, 0.025);				
			bg_set_perspective_x(0.015, 0);
			bg_add_layer(spr_aiz1_bg_layer5, 0, 400, -16, 0, 0, 0, 0.0175, 0.030);				
			bg_set_perspective_x(0.0175, 0);
			bg_add_layer(spr_aiz1_bg_layer6, 0, 400, 0, 0, 0, 0, 0.02, 0.035);				
			bg_set_perspective_x(0.02, 0);
			bg_add_layer(spr_aiz1_bg_layer7, 0, 400, 0, 0, 0, 0, 0.04, 0.040);				
			bg_set_perspective_x(0.04, 0);
			bg_add_layer(spr_aiz1_bg_layer8, 0, 400, 0, 0, 0, 0, 0.08, 0.045);				
			bg_set_perspective_x(0.08, 0);
			bg_add_layer(spr_aiz1_bg_layer9, 0, 400, 0, 0, 0, 0, 0.1, 0.050);				
			bg_set_perspective_x(0.1, 0);
			bg_add_layer(spr_aiz1_bg_layer10, 0, 400, 0, 0, 0, 0, 0.15, 0.06);				
			bg_set_perspective_x(0.15, 0);
			bg_add_layer(spr_aiz1_bg_layer11, 0, 400, 16, 0, 0, 0, 0.175, 0.07);				
			bg_set_perspective_x(0.175, 0);
			bg_add_layer(spr_aiz1_bg_layer12, 0, 400, 16, 0, 0, 0, 0.2, 0.08);				
			bg_set_perspective_x(0.2, 0);
			bg_add_layer(spr_aiz1_bg_layer13, 0, 400, 32, 0, 0, 0, 0.25, 0.09);				
			bg_set_perspective_x(0.25, 0);
			bg_add_layer(spr_aiz1_bg_layer14, 0, 400, 32, 0, 0, 0, 0.3, 0.1);				
			bg_set_perspective_x(0.3, 0);
			
			
		break;
		
		case rm_stage_aiz2:
		
		m_stage_set(14, "AURORA ICEFIELD", 1, bgm_aiz2_fairyofaif, m_local_random_animals(_animal_array), 2000, -1, rm_devmenu, true);
		
		player_spawn(100, 1808, global.player_main, "Objects");
		player_spawn(70, 1808, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_aiz1_bg_layer0, 0, 400, 0, 0, 0, 0, 0, 0.050);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_aiz1_bg_layer1, 0, 400, 0, 0, 0, 0, 0.0175, 0.050);				
			bg_set_perspective_x(0.0175, 0);
			bg_add_layer(spr_aiz1_bg_layer2, 0, 400, 0, 0, 0, 0, 0.015, 0.050);				
			bg_set_perspective_x(0.015, 0);
			bg_add_layer(spr_aiz1_bg_layer3, 0, 400, 0, 0, 0, 0, 0.025, 0.050);				
			bg_set_perspective_x(0.025, 0);
			bg_add_layer(spr_aiz1_bg_layer4, 0, 400, 0, 0, 0, 0, 0.015, 0.050);				
			bg_set_perspective_x(0.015, 0);
			bg_add_layer(spr_aiz1_bg_layer5, 0, 400, 0, 0, 0, 0, 0.0175, 0.050);				
			bg_set_perspective_x(0.0175, 0);
			bg_add_layer(spr_aiz1_bg_layer6, 0, 400, 0, 0, 0, 0, 0.02, 0.050);				
			bg_set_perspective_x(0.02, 0);
			bg_add_layer(spr_aiz1_bg_layer7, 0, 400, 0, 0, 0, 0, 0.04, 0.050);				
			bg_set_perspective_x(0.04, 0);
			bg_add_layer(spr_aiz1_bg_layer8, 0, 400, 0, 0, 0, 0, 0.08, 0.050);				
			bg_set_perspective_x(0.08, 0);
			bg_add_layer(spr_aiz1_bg_layer9, 0, 400, 0, 0, 0, 0, 0.1, 0.050);				
			bg_set_perspective_x(0.1, 0);
			bg_add_layer(spr_aiz1_bg_layer10, 0, 400, 0, 0, 0, 0, 0.15, 0.050);				
			bg_set_perspective_x(0.15, 0);
			bg_add_layer(spr_aiz1_bg_layer11, 0, 400, 0, 0, 0, 0, 0.175, 0.050);				
			bg_set_perspective_x(0.175, 0);
			bg_add_layer(spr_aiz1_bg_layer12, 0, 400, 0, 0, 0, 0, 0.2, 0.050);				
			bg_set_perspective_x(0.2, 0);
			bg_add_layer(spr_aiz1_bg_layer13, 0, 400, 0, 0, 0, 0, 0.25, 0.050);				
			bg_set_perspective_x(0.25, 0);
			bg_add_layer(spr_aiz1_bg_layer14, 0, 400, 0, 0, 0, 0, 0.3, 0.050);				
			bg_set_perspective_x(0.3, 0);
			
			break;
		
			case rm_stage_esz1:
		
		m_stage_set(15, "EGGSERVATORY", 0, bgm_esz1_degeneracyyamajet, m_local_random_animals(_animal_array), 2500, -1, rm_devmenu, true);
		
		player_spawn(100, 1488, global.player_main, "Objects");
		player_spawn(70, 1488, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		break;
		
		case rm_stage_esz2:
		
		m_stage_set(16, "EGGSERVATORY", 1, bgm_esz2_degeneracysaturn, m_local_random_animals(_animal_array), 20000, -1, rm_devmenu, true);
		
		player_spawn(1275, 19935, global.player_main, "Objects");
		player_spawn(1275, 19935, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		 
		break;
		
		case rm_stage_hhz:
		
		m_stage_set(17, "HILLTOP HEIGHTS", ACT_SINGLE, bgm_hhz, m_local_random_animals(_animal_array), 4000, -1, rm_devmenu, true);
		
		player_spawn(100, 624, global.player_main, "Objects");
		player_spawn(80, 624, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		 
		break;
		
		case rm_stage_acz_r:
		
		m_stage_set(18, "AZURE CARNIVAL", 0, bgm_acz_r_joinus4happytime, m_local_random_animals(_animal_array), 1088, 912, rm_devmenu, true);
		
		player_spawn(100, 800, global.player_main, "Objects");
		player_spawn(80, 800, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_acz_bg_layer0, 0, 240, 0, 0, 0, 0, 0, 0.01);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_acz_bg_layer1, 0, 16, 16, 0, -0.03, 0, 0.03, 0.02);
			bg_add_layer(spr_acz_bg_layer1, 16, 16, 32, 0, -0.04, 0, 0.04, 0.02);
			bg_add_layer(spr_acz_bg_layer1, 32, 16, 48, 0, -0.05, 0, 0.05, 0.02);
			bg_set_perspective_x(0.05, 0);
			bg_add_layer(spr_acz_bg_layer2, 0, 240, 32, 0, 0, 0, 0.05, 0.03);				
			bg_set_perspective_x(0.05, 0);
			bg_add_layer(spr_acz_bg_layer3, 0, 240, 32, 0, 0, 0, 0.075, 0.04);				
			bg_set_perspective_x(0.075, 0);
			bg_add_layer(spr_acz_bg_layer4, 0, 240, 32, 0, 0, 0, 0.1, 0.06);				
			bg_set_perspective_x(0.1, 0);
			bg_add_layer(spr_acz_bg_layer5, 0, 240, 32, 0, 0, 0, 0.15, 0.06);				
			bg_set_perspective_x(0.15, 0);
			bg_add_layer(spr_acz_bg_layer6, 0, 240, 32, 0, 0, 0, 0.2, 0.08);				
			bg_set_perspective_x(0.2, 0);
			bg_add_layer(spr_acz_bg_layer7, 0, 240, 128, 0, 0, 0, 0.3, 0.10);				
			bg_set_perspective_x(0.3, 0);
			
		break;
		
		case rm_stage_wr3z_r:
		
		m_stage_set(19, "WAHOO RACEWAY", 2, bgm_wr3z, m_local_random_animals(_animal_array), 2000, -1, rm_devmenu, true);
		
		player_spawn(100, 1872, global.player_main, "Objects");
		player_spawn(70, 1872, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		// Background
			
			bg_add_layer(spr_wr3z_bg_layer0, 0, 400, 0, 0, 0, 0, 0, 0.01);				
			bg_set_perspective_x(0, 0)
			bg_add_layer(spr_wr3z_bg_layer1, 0, 400, 0, 0, 0, 0, 0, 0.01);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_wr3z_bg_layer2, 0, 400, -64, 0, 0, 0, 0, 0.01);				
			bg_set_perspective_x(0, 0);
			bg_add_layer(spr_wr3z_bg_layer3, 0, 400, -64, 0, 0, 0, 0.01, 0.01);				
			bg_set_perspective_x(0.01, 0);
			bg_add_layer(spr_wr3z_bg_layer4, 0, 400, -64, 0, 0, 0, 0.03, 0.01);				
			bg_set_perspective_x(0.03, 0);
			bg_add_layer(spr_wr3z_bg_layer5, 0, 400, -48, 0, 0, 0, 0.05, 0.025);				
			bg_set_perspective_x(0.05, 0);
			bg_add_layer(spr_wr3z_bg_layer6, 0, 400, -32, 0, 0, 0, 0.06, 0.03);				
			bg_set_perspective_x(0.06, 0);
			bg_add_layer(spr_wr3z_bg_layer7, 0, 400, -16, 0, 0, 0, 0.075, 0.05);				
			bg_set_perspective_x(0.075, 0);
			bg_add_layer(spr_wr3z_bg_layer8, 0, 400, 0, 0, 0, 0, 0.1, 0.06);				
			bg_set_perspective_x(0.1, 0);
			bg_add_layer(spr_wr3z_bg_layer9, 0, 400, 0, 0, 0, 0, 0.125, 0.065);				
			bg_set_perspective_x(0.15, 0);
			bg_add_layer(spr_wr3z_bg_layer10, 0, 400, 0, 0, 0, 0, 0.15, 0.070);				
			bg_set_perspective_x(0.2, 0);
			bg_add_layer(spr_wr3z_bg_layer11, 0, 400, 0, 0, 0, 0, 0.3, 0.075);				
			bg_set_perspective_x(0.3, 0);
		
		break;
		
		case rm_stage_bhz:
		
		m_stage_set(21, "BIG HILL", ACT_SINGLE, bgm_ccz_hulahoop, m_local_random_animals(_animal_array), 12000, -1, rm_devmenu, true);
		
		player_spawn(100, 11936, global.player_main, "Objects");
		player_spawn(70, 11936, global.player_cpu, "Objects");
		
		collision_load_binary("widths_tsz", "heights_tsz", "angles_tsz", "CollisionA", "CollisionB");
		
		break;
		
	}
}