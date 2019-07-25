sprite_index = spr_player_pickup
mask_index = spr_player_mask
image_speed = .3

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	if ysp <= 0{
		state = jump
	}else{
		state = fall
	}
}else{ // If on ground
	if image_index > image_number-1{
		image_speed = 0
		state = stand
	}
}


