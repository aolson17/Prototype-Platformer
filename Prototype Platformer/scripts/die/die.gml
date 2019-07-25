sprite_index = spr_player_knock_down_sword
mask_index = spr_player_mask_crouch
image_speed = 1.2

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
		state = hold
	}
}


