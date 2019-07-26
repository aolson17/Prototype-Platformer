if holding != false{
	sprite_index = spr_player_fall_hold
	mask_index = spr_player_mask_hold
}else {
	sprite_index = spr_player_fall
	mask_index = spr_player_mask
}
image_speed = .2

if prev_state != state{
	image_index = 0
}
prev_state = state

if !place_meeting(x,y+1,par_solid){ // If in air
	if image_index > image_number - 1{
		image_speed = 0
	}
	
	if ysp <= 0{
		state = jump
	}
	
	if holding = false && place_meeting(x,y,obj_ladder)&&(obj_control.up_key || obj_control.down_key){
		ysp = 0
		state = ladder
	}
}else{ // If on ground
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
	
	image_xscale = face
}

