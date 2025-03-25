#region DEBUG

if global.dev_mode
{
	var _key_collision = ord("1");
	var _key_game_speed = ord("2");
	var _key_restart_room = ord("9"); 
	var _key_restart_game = ord("0");
	var _key_profiler = vk_f1;
	var _key_console = vk_f2;
	var _key_devmenu = vk_escape;
	
	if !is_keyboard_used_debug_overlay()
	{
		if keyboard_check_pressed(_key_collision)
		{
		    if ++global.debug_collision > 3
		    {
		        global.debug_collision = 0;
		    }
		}
		else if keyboard_check_pressed(_key_game_speed)
		{
		    if game_get_speed(gamespeed_fps) != 2
		    {
		        game_set_speed(2, gamespeed_fps);
		    }
		    else
		    {
		        game_set_speed(60, gamespeed_fps);
		    }
		}
		else if keyboard_check_pressed(_key_restart_room)
		{
		    room_restart();
		}
		else if keyboard_check_pressed(_key_restart_game)
		{
		    game_restart();
		}
		else if keyboard_check_pressed(_key_devmenu)
		{
		    room_goto(rm_devmenu);
		}
		else if keyboard_check_pressed(_key_profiler)
		{
			show_debug_overlay(!is_debug_overlay_open());
		}
		else if keyboard_check_pressed(_key_console)
		{
			show_debug_log(!is_debug_overlay_open());
		}
	}
}

#endregion

#region INPUT

var _act1a = ord("A"), _act1b = ord("Z");
var _act2a = ord("S"), _act2b = ord("X");
var _act3a = ord("D"), _act3b = ord("C");

var _input = input;
var _pads_array = _input.pads_array;
var _vibration = _input.vibration;
var _system_device_count = _input.system_device_count;
var _pads_registered = 0;

for (var i = 0; i < _system_device_count; i++)
{
	if !gamepad_is_connected(i) 
	{
	    continue;
	}

	_pads_array[_pads_registered] = i;

	if ++_pads_registered == ENGINE_INPUT_MAX_DEVICE_COUNT
	{
	    break;
	}
}

for (var i = 0; i < ENGINE_INPUT_MAX_DEVICE_COUNT; i++)
{
	if is_keyboard_used_debug_overlay()
	{
		break;
	}	
		
	var _press = input_get_pressed(i);
	var _down = input_get(i);
	
	// Process input for each registered gamepad
	if i < _pads_registered
	{
	    var _pad_id = _pads_array[i];
		
	    if _vibration[i] >= 0
	    {
			_vibration[i]--;
	        gamepad_set_vibration(_pad_id, 0, 0);
	    }

	    var _lv_value = gamepad_axis_value(_pad_id, gp_axislv);
	    var _lh_value = gamepad_axis_value(_pad_id, gp_axislh);

	    _press.up = gamepad_button_check_pressed(_pad_id, gp_padu) || (_lv_value < 0 && !_down.up);
	    _press.down = gamepad_button_check_pressed(_pad_id, gp_padd) || (_lv_value > 0 && !_down.down);
	    _press.left = gamepad_button_check_pressed(_pad_id, gp_padl) || (_lh_value < 0 && !_down.left);
	    _press.right = gamepad_button_check_pressed(_pad_id, gp_padr) || (_lh_value > 0 && !_down.right);
	    _press.start = gamepad_button_check_pressed(_pad_id, gp_start);
	    _press.action1 = gamepad_button_check_pressed(_pad_id, gp_face1);
	    _press.action2 = gamepad_button_check_pressed(_pad_id, gp_face2);
	    _press.action3 = gamepad_button_check_pressed(_pad_id, gp_face4);

	    _down.up = gamepad_button_check(_pad_id, gp_padu) || _lv_value < 0;
	    _down.down = gamepad_button_check(_pad_id, gp_padd) || _lv_value > 0;
	    _down.left = gamepad_button_check(_pad_id, gp_padl) || _lh_value < 0;
	    _down.right = gamepad_button_check(_pad_id, gp_padr) || _lh_value > 0;
	    _down.start = gamepad_button_check(_pad_id, gp_start);
	    _down.action1 = gamepad_button_check(_pad_id, gp_face1);
	    _down.action2 = gamepad_button_check(_pad_id, gp_face2);
	    _down.action3 = gamepad_button_check(_pad_id, gp_face4);
	} 
	else 
	{
		// Reset input states for unused pads
	    input_reset(_press);
	    input_reset(_down);
		
	    if i != 0 
	    {
	        continue;
	    }
	}
	
	// Handle keyboard input for the first input slot
	if i == 0 
	{
	    _press.up |= keyboard_check_pressed(vk_up);
	    _press.down |= keyboard_check_pressed(vk_down);
	    _press.left |= keyboard_check_pressed(vk_left);
	    _press.right |= keyboard_check_pressed(vk_right);
	    _press.start |= keyboard_check_pressed(vk_enter);
	    _press.action1 |= keyboard_check_pressed(_act1a) || keyboard_check_pressed(_act1b);
	    _press.action2 |= keyboard_check_pressed(_act2a) || keyboard_check_pressed(_act2b);
	    _press.action3 |= keyboard_check_pressed(_act3a) || keyboard_check_pressed(_act3b);

	    _down.up |= keyboard_check(vk_up);
	    _down.down |= keyboard_check(vk_down);
	    _down.left |= keyboard_check(vk_left);
	    _down.right |= keyboard_check(vk_right);
	    _down.start |= keyboard_check(vk_enter);
	    _down.action1 |= keyboard_check(_act1a) || keyboard_check(_act1b);
	    _down.action2 |= keyboard_check(_act2a) || keyboard_check(_act2b);
	    _down.action3 |= keyboard_check(_act3a) || keyboard_check(_act3b);
	}

	_down.action_any = _down.action1 || _down.action2 || _down.action3;
	_press.action_any = _press.action1 || _press.action2 || _press.action3;
	
	// Handle simultaneous input conflicts
	if _down.left && _down.right
	{
	    _down.left = false;
	    _down.right = false;
	    _press.left = false;
	    _press.right = false;
	}

	if _down.up && _down.down
	{
	    _down.up = false;
	    _down.down = false;
	    _press.up = false;
	    _press.down = false;
	}
}

#endregion

#region FADE

var _fade = fade;

if _fade.timer >= 0 && _fade.timer < ENGINE_FADE_TIMER_MAX
{
	_fade.state = _fade.timer == 0 ? FADESTATE.PLAINCOLOUR : FADESTATE.ACTIVE;
} 
else if _fade.state != FADESTATE.NONE
{
	if _fade.game_control
	{
	    state = STATE_NORMAL;
	}

	_fade.state = FADESTATE.NONE;
}

if _fade.process_flag == ENGINE_FADE_FLAG_UPDATE 
{
	if _fade.game_control 
	{
	    state = STATE_PAUSED;
	}

	if ++_fade.frequency_timer == _fade.frequency_target
	{
	    _fade.frequency_timer = 0;

	    if _fade.routine == FADEROUTINE.IN && _fade.timer < ENGINE_FADE_TIMER_MAX 
	    {
	        _fade.timer += _fade.timer_step;

	        if _fade.timer >= ENGINE_FADE_TIMER_MAX 
	        {
	            _fade.timer = ENGINE_FADE_TIMER_MAX;
	            _fade.process_flag = ENGINE_FADE_FLAG_IDLE;
	        }
	    } 
	    else if _fade.routine == FADEROUTINE.OUT && _fade.timer > 0
	    {
	        _fade.timer -= _fade.timer_step;

	        if _fade.timer <= 0 
	        {
	            _fade.timer = 0;
	            _fade.process_flag = ENGINE_FADE_FLAG_IDLE;
	        }
	    }
	}
}

#endregion

#region PAUSE & FRAME COUNTER

if state != STATE_PAUSED
{
	if allow_pause && input_get_pressed(0).start 
	{
	    instance_create_depth(0, 0, RENDERER_DEPTH_HUD, obj_gui_pause);
	} 
	else 
	{
	    frame_counter++;
	}
} 
else with obj_gui_pause
{
	event_perform(ev_other, ev_user0);
}

#endregion

#region OBJECT CULLING

if state != STATE_NORMAL
{
	var _framework = id;
	var _ignored_behaviour = state == STATE_STOP_OBJECTS ? CULLING.PAUSEONLY : CULLING.NONE;

	with c_object
	{
	    var _behaviour = data_culling.behaviour;

	    if _behaviour <= _ignored_behaviour
		{
	        continue;
	    }
		
		// Add objects to the ds_cull_list_pause list to let the engine draw them later
		if !_framework.is_initial_cull || _behaviour <= CULLING.ACTIVE || obj_is_visible()
		{
			ds_list_add(_framework.ds_cull_list_pause, id);
		}
		
	    instance_deactivate_object(id);
	}
} 
else 
{
	// Reactivate the objects added to the ds_cull_list_pause list
	m_framework_activate_stopped_objects();
	
	// Remember currently loaded objects
	with c_object
	{
		ds_list_add(c_framework.ds_cull_list_active, id);
	}
	
	// Activate objects within the camera's new culling region
	for (var i = 0; i < CAMERA_COUNT; i++)
	{
	    var _camera = camera_get_data(i);

	    if _camera == noone
		{
	        continue;
	    }
		
	    _camera.coarse_x = (camera_get_x(i) - 128) & -128;
	    _camera.coarse_y = (camera_get_y(i) - 128) & -128;
		
	    if _camera.coarse_x_last == _camera.coarse_x && _camera.coarse_y_last == _camera.coarse_y
		{
	        continue;
	    }
		
		_camera.coarse_x_last = _camera.coarse_x;
	    _camera.coarse_y_last = _camera.coarse_y;
		
		var _cull_width = camera_get_width(i) * 2;
	    var _cull_height = camera_get_height(i) * 2 + 64;
		
	    instance_activate_region(_camera.coarse_x, _camera.coarse_y, _cull_width - 1, _cull_height - 1, true);	
	}
	
	with c_object
	{
		// Since we're here, reset the interaction flag as well
	    data_interact.interact = true;
		
	    var _data_culling = data_culling;
	    var _behaviour = _data_culling.behaviour;
			
	    if _behaviour <= CULLING.ACTIVE 
		{
	        continue;
	    }
		
		// Reset or deactivate the object if it was just loaded
		if ds_list_find_index(c_framework.ds_cull_list_active, id) == -1
		{
			if obj_is_visible()
			{
				instance_deactivate_object(id);
			}
			else if _behaviour >= CULLING.RESPAWN
			{
				event_perform(ev_create, 0);
			}
			
			continue;
		}
		
		// Cull objects
	    var _cull_width, _cull_height, _cull_action, _dist_x, _dist_y, _y;
		
		for (var i = 0; i < CAMERA_COUNT; i++) 
		{
		    var _camera = camera_get_data(i);

		    if _camera == noone
			{
				continue;
			}
			
			// Reset the flag
			_cull_action = CULLING.NONE;
			
		    _cull_width = camera_get_width(i) * 2;
		    _cull_height = camera_get_height(i) * 2 + 64;

		    switch _behaviour
			{
		        case CULLING.RESPAWN:
				case CULLING.DISABLE:
				
		            _dist_x = (floor(x) - _camera.coarse_x) & -128;
		            _dist_y = (floor(y) - _camera.coarse_y) & -128;
					
		            if _dist_x < 0 || _dist_x >= _cull_width || _dist_y < 0 || _dist_y >= _cull_height
					{
						_cull_action = _behaviour;
					} 
					
		        break;
				
				case CULLING.ORIGINRESPAWN:
				case CULLING.ORIGINDISABLE:
				
		            _dist_x = (xstart - _camera.coarse_x) & -128;
		            _dist_y = (ystart - _camera.coarse_y) & -128;
					
		            if _dist_x < 0 || _dist_x >= _cull_width || _dist_y < 0 || _dist_y >= _cull_height
					{
						_cull_action = _behaviour;
					}
					
		        break;
				
		        case CULLING.REMOVE:
					
		            _y = floor(y);
		            _dist_x = (floor(x) - _camera.coarse_x) & -128;
		            _dist_y = (_y - camera_get_y(i)) + 128;
					
					if _dist_x < 0 || _dist_x >= _cull_width || _dist_y < 0 || _dist_y >= _cull_height || _y >= _camera.max_y
					{
						_cull_action = _behaviour;
					}
					
		        break;
		    }
			
			// Do not check the next available camera if the flag is not set
			if _cull_action == CULLING.NONE
			{
				break;
			}
		}
		
		// Perform the action based on the flag set
		switch _cull_action
		{
			case CULLING.RESPAWN:
			case CULLING.ORIGINRESPAWN:
			
				x = xstart;
		        y = ystart;
		        image_xscale = _data_culling.scale_x;
		        image_yscale = _data_culling.scale_y;
		        image_index = _data_culling.img_index;
		        sprite_index = _data_culling.spr_index;
		        visible = _data_culling.is_visible;
		        depth = _data_culling.priority;
		        instance_deactivate_object(id);
				
			break;
			
			case CULLING.DISABLE:
			case CULLING.ORIGINDISABLE:
				instance_deactivate_object(id);
			break;
			
			case CULLING.REMOVE:
				instance_destroy();
			break;
		}
	}
	
	ds_list_clear(ds_cull_list_active);
}

#endregion

#region INSTANCES ANIMATOR

if state != STATE_PAUSED
{
	with c_object
	{
	    var _data_ani = data_ani;

	    if _data_ani.timer == undefined || _data_ani.timer < 0
	    {
	        continue;
	    }
		
	    if _data_ani.sprite_previous != sprite_index
	    {
	        _data_ani.sprite_previous = sprite_index;
	    }

	    if _data_ani.timer == 0
	    {
	        _data_ani.timer = ani_get_duration();
	    }

	    if --_data_ani.timer != 0
	    {
	        continue;
	    }

	    var _order_length = array_length(_data_ani.order);
	    var _last_frame = _order_length > 0 ? _order_length - 1 : image_number - 1;
		
		// Stop the animation
	    if _data_ani.index == _last_frame && _data_ani.index == _data_ani.loopframe
	    {
	        _data_ani.timer = -4;
	        continue;
	    }

	    if _data_ani.index < _last_frame
	    {
	        _data_ani.index++;
	    }
	    else
	    {
	        _data_ani.index = _data_ani.loopframe;
	    }

	    _data_ani.timer = ani_get_duration();
	    image_index = _order_length > 0 ? _data_ani.order[_data_ani.index] : _data_ani.index;
	}
}

#endregion

#region PALETTE

var _palette = palette;

if state != STATE_PAUSED
{
	var _ds_colours = _palette.ds_colours;
	var _ds_size = ds_list_size(_ds_colours);
	var _timer = _palette.timer;
	var _index = _palette.index;

	for (var i = 0; i < _ds_size; i++)
	{
	    var _col_id = _ds_colours[| i];
	    var _duration = _palette.duration[_col_id];

	    if _duration <= 0
	    {
	        continue;
	    }

	    if --_timer[_col_id] <= 0
	    {
	        if ++_index[_col_id] > _palette.end_index[_col_id]
	        {
	            _index[_col_id] = _palette.loop_index[_col_id];
	        }

	        _timer[_col_id] = _duration;
	    }
	}

	ds_list_clear(_ds_colours);
}

#endregion

with obj_player
{
	event_perform(ev_other, ev_user0);
}