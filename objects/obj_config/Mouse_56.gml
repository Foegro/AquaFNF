if (point_in_rectangle(mouse_x,mouse_y,16,16,16+16,16+16)) global.downscroll = !global.downscroll
if (point_in_rectangle(mouse_x,mouse_y,16,16+32,16+16,16+16+32)) global.right_side = !global.right_side
if (point_in_rectangle(mouse_x,mouse_y,16,480-32-8,16+16,480-32+8)) room_goto(rm_testsong)