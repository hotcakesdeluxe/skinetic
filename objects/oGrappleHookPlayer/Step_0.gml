event_inherited();

var _input_grapple = gamepad_button_check_pressed(0, gp_shoulderrb);

if(_input_grapple)
{
	show_debug_message(r[0])
	if(r[0] != 0)
	{
		add_impulse_direction(aimDir, 2000)
	}
}