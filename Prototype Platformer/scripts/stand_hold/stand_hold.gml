sprite_index = spr_player_hold
mask_index = spr_player_mask_hold

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
	if floor(image_index) = 0{
		image_speed = 0
		image_index = 0
		
		if irandom(300)=1{ // Blick Randomly
			image_index = 1
		}
	}else{
		image_speed = .5
	}
	
	if keyboard_check_released(pickup_key){ // Try to put down
		if !place_meeting(x+face*18,y,par_solid){
			instance_create_layer(x+face*17,y-5,"Instances",holding)
			holding = false
			state = set_down
		}
	}
	
	if xsp != 0{
		state = hold
	}
	
	image_xscale = face
}


