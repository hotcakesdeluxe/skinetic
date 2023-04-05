var _grav   = C_GRAVITY,
	_xscale = image_xscale;
	
//Checking for gamepad could be a lot better. Will fix with multiplayer

if(isGamepad)
{
	gamepad_set_axis_deadzone(0, 0.2);
	input_x = gamepad_axis_value(0, gp_axislh);
	if (gamepad_button_check_pressed(0, gp_face1))
		jump_remember = C_REMEMBER_FRAMES;
		
	var xaxis = gamepad_axis_value(0, gp_axisrh);
	var yaxis = gamepad_axis_value(0, gp_axisrv);
	var spd_max = 16; // Maximum cursor speed for the gamepad.

	offset_x += (spd_max*xaxis);
	offset_y += (spd_max*yaxis);
	
	aim_x = clamp(offset_x, camera_get_view_x(VIEW), camera_get_view_x(VIEW)+camera_get_view_width(VIEW));
	aim_y = clamp(offset_y, camera_get_view_y(VIEW), camera_get_view_y(VIEW)+camera_get_view_height(VIEW));
}
else
{
	input_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	if (keyboard_check_pressed(vk_space))
		jump_remember = C_REMEMBER_FRAMES;
}


	
#region Locomotion

	if (on_vertical)
	{
		// Normal friction
		move_friction = 1;
	
		if (jump_remember)
		{
			add_impulse_direction(90 - 25 * input_x, 300);
			jump_remember = 0;
			on_vertical = 0;
		}
	}
	else
	{
		// Air control
		move_friction = 0.5;
	
		if (on_horizontal == 0)
		{
			if (velocity_y < 0)
			{
				// Variable jump height
				if (!keyboard_check(vk_space))
					impulse_force_y *= C_VARIABLE_JUMP_FRICTION;
			}	
			
		}
		else
		{
			if (jump_remember)
			{
				// Wall jump
				add_impulse_direction(90 + sign(on_horizontal) * 25, 300);
				jump_remember = 0;
				on_horizontal = 0;
			}
			else if (velocity_y > 0)
			{
				// Slide down wall slow
				_grav *= C_ON_WALL_FRICTION;
			}
		}
	}

	// Platformer gravity
	add_constant_force(270, _grav);

	if (input_x != 0)
	{
		_xscale = sign(input_x);
		add_movement_direction(darccos(input_x));
	}
	
#endregion

// Counters
jump_remember  = jump_remember >> 1;
slash_remember = slash_remember >> 1;
throw_remember = throw_remember >> 1;


event_inherited();