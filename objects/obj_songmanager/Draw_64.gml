var yy = global.downscroll ? (480-64) : (64)

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
		draw_sprite_ext(spr_arrow,0,(arrow.side == sides.player ^^ global.right_side) ? (640/4-32-64+64*arrow.dir) : (640*3/4-32-64+64*arrow.dir),yy-(global.downscroll*2-1)*arrow.distance*pixels_per_second,1,1,angle,arrow_colors[arrow.dir],1)
	}
}