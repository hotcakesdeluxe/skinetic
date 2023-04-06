event_inherited();

#macro C_ON_WALL_FRICTION 0.6
#macro C_VARIABLE_JUMP_FRICTION .8
#macro C_REMEMBER_FRAMES (1 << 15) // uses binary counter

var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
{
    if gamepad_is_connected(i) global.gp[i] = true else global.gp[i] = false;
	
}
//should change this for multiplayer
isGamepad = global.gp[0];

jump_remember  = 0;
slash_remember = 0;
throw_remember = 0;
input_x = 0;
