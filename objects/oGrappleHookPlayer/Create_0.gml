event_inherited();

var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
{
    if gamepad_is_connected(i) global.gp[i] = true else global.gp[i] = false;
	
}
isGamepad = global.gp[0]

jump_remember  = 0;
slash_remember = 0;
throw_remember = 0;
input_x = 0;

offset_x = 0;
offset_y = 0;

gun_length = sprite_get_width(sGrapple) - sprite_get_xoffset(sGrapple);