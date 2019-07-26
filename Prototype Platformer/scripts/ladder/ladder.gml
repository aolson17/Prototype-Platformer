if ysp <= 0{
	sprite_index = spr_player_ladder_up
}else {
	sprite_index = spr_player_ladder_down
}
	mask_index = spr_player_mask
image_speed = abs(ladder_image_speed_factor*ysp)

if prev_state != state{
	image_index = 0
}
prev_state = state

x = instance_nearest(x,y,obj_ladder).x+6
xsp = 0

if place_meeting(x,y+1,par_solid){ // If on ground
	if holding != false{
		if xsp = 0{
			state = stand_hold
		}else {
			state = hold
		}
	}else{
		if xsp = 0{
			state = stand
		}else {
			state = run
		}
	}
}

