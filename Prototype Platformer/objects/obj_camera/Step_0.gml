
if instance_number(obj_camera_block)>0{
	x = lerp(x,obj_camera_block.x,spd_factor)
	y = lerp(y,obj_camera_block.y,spd_factor)
}else{
	if obj_player.holding = obj_camera_block{
		x = lerp(x,obj_player.x+obj_player.x_offset,spd_factor)
		y = lerp(y,obj_player.y+obj_player.y_offset,spd_factor)
	}
}

camera_set_view_pos(camera,x-width/2, y-height/2)
//camera_set_view_pos(camera,x-width/2, y-height/2)