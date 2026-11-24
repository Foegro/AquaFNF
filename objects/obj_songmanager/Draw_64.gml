draw_set_colour(c_black)
var yy = global.downscroll ? 32 : (480-32)
draw_rectangle(0,yy-32,640,yy+32,false)
draw_sprite(spr_player_head,0,640/3+24,yy)
draw_sprite(spr_bnameboyfriend,0,640/3+48+4,yy)
draw_sprite(spr_hpname,0,640/3+48+4+43,yy+4)
draw_set_colour(c_red)
draw_rectangle(640/3+48+4+43+20,yy+4,640*2/3-8,yy+4+11,false)
draw_set_colour(c_aqua)
draw_rectangle(640/3+48+4+43+20,yy+4,lerp(640/3+48+4+43+20,640*2/3-8,visual_hp/100),yy+4+11,false)
draw_set_colour(c_white)
draw_set_font(fnt_main)
draw_set_halign(fa_middle)
draw_set_valign(fa_bottom)
draw_text((640/3+48+4+43+20+640*2/3-8)/2,yy,$"{round(hp)}/100")
draw_set_halign(fa_left)
draw_text(32,yy-8,$"Score: {round(current_score)}")
draw_text(32,yy+8,$"Combo: {round(combo)}")
draw_text(640*2/3+32,yy-8,$"Accuracy: {string_format(accuracy()*100,3,2)}%")
draw_text(640*2/3+32,yy+8,$"Misses: {misses}")
draw_set_font(-1)
draw_set_valign(fa_top)


yy = global.downscroll ? (480-64) : (64)

draw_sprite_ext(spr_arrow_goal,0,640/4-32-64,yy,1,1,180,c_white,1)
draw_sprite_ext(spr_arrow_goal,0,640/4-32,yy,1,1,270,c_white,1)
draw_sprite_ext(spr_arrow_goal,0,640/4+32,yy,1,1,90,c_white,1)
draw_sprite_ext(spr_arrow_goal,0,640/4+32+64,yy,1,1,0,c_white,1)

draw_sprite_ext(spr_arrow_goal,0,640*3/4-32-64,yy,1,1,180,c_white,1)
draw_sprite_ext(spr_arrow_goal,0,640*3/4-32,yy,1,1,270,c_white,1)
draw_sprite_ext(spr_arrow_goal,0,640*3/4+32,yy,1,1,90,c_white,1)
draw_sprite_ext(spr_arrow_goal,0,640*3/4+32+64,yy,1,1,0,c_white,1)

for (var i = 0; i < array_length(arrows); i++) {
	var arrow = arrows[i]
	if (arrow.distance*pixels_per_second < 480) {
		var angle
		switch (arrow.dir) {
			case dirs.left:
				angle = 180
				break
			case dirs.down:
				angle = 270
				break
			case dirs.up:
				angle = 90
				break
			case dirs.right:
				angle = 0
				break
		}
		var col = (arrow[$"missed"] ?? false) ? make_colour_rgb(colour_get_red(arrow_colors[arrow.dir])/2,colour_get_green(arrow_colors[arrow.dir])/2,colour_get_blue(arrow_colors[arrow.dir])/2) : arrow_colors[arrow.dir]
		if !(arrow[$"hit"] ?? false) draw_sprite_ext(spr_arrow,0,(arrow.side == sides.player ^^ global.right_side) ? (640/4-32-64+64*arrow.dir) : (640*3/4-32-64+64*arrow.dir),yy-(global.downscroll*2-1)*arrow.distance*pixels_per_second,1,1,angle,col,1)
		if (struct_exists(arrow,"length")) {
			if !(arrow[$"hit"] ?? false) draw_sprite_ext(spr_arrow_trail,0,(arrow.side == sides.player ^^ global.right_side) ? (640/4-32-64+64*arrow.dir) : (640*3/4-32-64+64*arrow.dir),yy-(global.downscroll*2-1)*arrow.distance*pixels_per_second,1,arrow.length*pixels_per_second/32,angle,col,1)
			else draw_sprite_ext(spr_arrow_trail,0,(arrow.side == sides.player ^^ global.right_side) ? (640/4-32-64+64*arrow.dir) : (640*3/4-32-64+64*arrow.dir),yy,1,(arrow.length+clamp(arrow.distance,-arrow.length,0))*pixels_per_second/32,angle,col,1)
		}
	}
}