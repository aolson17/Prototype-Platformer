sprite_index = spr_player_idle
mask_index = spr_player_mask

holding = false

if prev_state != state{
	image_index = 0
	image_speed = 0
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
	
	if obj_control.use_key_pressed{
		var temp_mask = mask_index
		mask_index = spr_player_mask_hold
		var list = ds_list_create()
		instance_place_list(x+2*face,y,par_solid,list,false)
		var fail = false
		var found_object = false
		for (var i = 0;i < ds_list_size(list);i++){
			var col = ds_list_find_value(list,i)
			if !object_is_ancestor(col.object_index,par_object){
				fail = true
				break
			}
			found_object = true
			break
		}
		if !fail && found_object{
			mask_index = temp_mask
			holding = col.object_index
			state = pick_up
			instance_destroy(col)
		}
		mask_index = temp_mask
	}
	
	if xsp != 0{
		state = run
	}
}


