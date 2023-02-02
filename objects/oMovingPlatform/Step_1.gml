var _target_x = endX, _target_y = endY;

if(goingToStart){
	_target_x = startX;
	_target_y = startY;
}	

moveX = sign(_target_x - x) * currentSpeed;
moveY = sign(_target_y - y) * currentSpeed;
