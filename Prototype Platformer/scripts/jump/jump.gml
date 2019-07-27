if holding != false{
	sprite_index = spr_player_jump_hold
	mask_index = spr_player_mask_hold
}else {
	sprite_index = spr_player_jump
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
	if holding != false{
		if obj_control.use_key_pressed{ // Throw Block Up
			if !place_meeting(x,y-1,par_solid){
				var obj = instance_create_layer(x,y-19,"Blocks",holding)
				obj.xsp = xsp
				obj.ysp = -3
				holding = false
				var sound = audio_play_sound(snd_box_toss,0,0)
				audio_sound_gain(sound,global.master_volume*global.sound_volume,0)
			}
		}
	}
	if ysp >= 0{
		state = fall
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

