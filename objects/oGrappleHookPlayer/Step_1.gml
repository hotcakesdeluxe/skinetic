	
var maxDist = 5; // Maximum cursor distance for the gamepad.
var maxDistReal = 50; // Maximum distance for the 'raycast' line draw.
//aim grapple but leave it facing last direction if stick goes neutral
if abs(gamepad_axis_value (0, gp_axisrh)) > gamepad_get_axis_deadzone(0)
{
	xaxis = gamepad_axis_value (0, gp_axisrh) ;
}

if abs(gamepad_axis_value (0, gp_axisrv)) >  gamepad_get_axis_deadzone(0)
{	
	yaxis = gamepad_axis_value (0, gp_axisrv) ;
}
	
aimDir = point_direction( 0, 0, xaxis, yaxis );
	
aim_cos = dcos(aimDir);
aim_sin = -dsin(aimDir);
aimX = x + (gun_length * aim_cos) * maxDist;
aimY = y + (gun_length * aim_sin) * maxDist;
	
aimRealX = x + (gun_length * aim_cos) * maxDistReal;
aimRealY = y + (gun_length * aim_sin) * maxDistReal;
r = collision_line_point(x, y, aimRealX, aimRealY, __collider, true, true);

