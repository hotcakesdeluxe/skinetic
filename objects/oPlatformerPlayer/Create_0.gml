event_inherited();

#macro C_ON_WALL_FRICTION 0.6
#macro C_VARIABLE_JUMP_FRICTION 0.8
#macro C_REMEMBER_FRAMES (1 << 15) // uses binary counter

jump_remember  = 0;
slash_remember = 0;
throw_remember = 0;
input_x = 0;
