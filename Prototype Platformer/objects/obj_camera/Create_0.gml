
width = 320
height = 180

spd_factor = .1

if instance_number(obj_camera_block)>0{
	x = obj_camera_block.x
	y = obj_camera_block.y
}

camera = camera_create_view(x,y,width,height)

view_set_camera(0,camera)