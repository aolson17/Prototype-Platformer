if !place_meeting(x,y+1,par_solid){ // Apply gravity
	if !place_meeting(x,y+1,obj_player){
		ysp += grav_speed
	}
}else{ // Apply Friction
	xsp *= .9
}
scr_collision()