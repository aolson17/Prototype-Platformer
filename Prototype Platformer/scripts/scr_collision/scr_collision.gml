
if place_meeting((x+xsp),(y),par_solid){
	var col = instance_place((x+xsp),(y),par_solid)
	var limit = abs(xsp)
	while(!place_meeting((x+sign(xsp)),(y),par_solid) && limit >= 0){
		//show_debug_message("while x 1")
		x += sign(xsp)
		//dis -= sign(xsp)
		limit -= abs(xsp)
	}
	if object_index = obj_player && move = sign(xsp) && (state = run || state = hold){
		// Step up
		while (!place_meeting((x+sign(xsp)),(y-step_size),par_solid) && limit > 0){
			y -= step_size
			ysp = 0
			while(!place_meeting((x+sign(xsp)),(y),par_solid) && abs(xsp) > 0 && limit > 0){
				//show_debug_message("while x 2")
				x += sign(xsp)
				limit -= abs(sign(xsp))
			}
			
			
		}
	}else{
		xsp = 0
	}
}else{
	x += xsp
}
if place_meeting((x),(y+ysp),par_solid){
	var col = instance_place((x),(y+ysp),par_solid)
	var limit = abs(ysp)
	while(!place_meeting((x),(y+sign(ysp)),par_solid) && limit >= 0){
		//show_debug_message("while y")
		y += sign(ysp)
		limit -= abs(sign(ysp))
	}
	if ysp > 0{ // If landing on ground
		y = round(y)
	}
	if place_meeting(x,y,par_solid){
		y--
	}
	ysp = 0
}else{
	y += ysp
}





