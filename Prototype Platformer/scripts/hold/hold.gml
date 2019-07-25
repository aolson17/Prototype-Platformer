sprite_index = spr_player_hold_run
mask_index = spr_player_mask_hold
image_speed = abs(holding_image_speed_factor*xsp)

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
	
	if xsp = 0 && move = 0{
		state = stand_hold
	}
	
	if obj_control.use_key_pressed{ // Try to put down
		if !place_meeting(x+face*20,y-10,par_solid){
			var obj = instance_create_layer(x+face*19,y-15,"Instances",holding)
			obj.xsp = xsp+face*(1.5)
			obj.ysp = -1
			mask_index = spr_player_mask
			holding = false
			state = set_down
		}
	}
	
	image_xscale = face
}


