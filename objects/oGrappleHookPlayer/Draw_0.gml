draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
draw_sprite_ext(sReticle, 0, aimX, aimY, 1, 1, 0, c_white, 1);
draw_sprite_ext(sGrapple, 0, x, y, image_xscale, image_yscale, aimDir, image_blend, image_alpha);

draw_line_width_colour(x, y, r[1], r[2], 4, c_red, c_blue);
