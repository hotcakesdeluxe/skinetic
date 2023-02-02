x += moveX;
y += moveY;

if(goingToStart && point_distance(x, y, startX, startY) < currentSpeed){
	goingToStart = false;
	currentSpeed = 0;
	alarm[0] = waitTime;
}
else if (!goingToStart && point_distance(x, y, endX, endY) < currentSpeed){
	goingToStart = true;
	currentSpeed = 0;
	alarm[0] = waitTime;
}