
if place_meeting((x+xsp),(y),par_solid){
	var col = instance_place((x+xsp),(y),par_solid)
	if col.xsp != 0 || col.ysp != 0{
		//col.xsp = 0
		//col.ysp = 0
		//xsp = 0
		//ysp = 0
	}
	var dis = xsp
	var limit = abs(xsp)
	while(!place_meeting(round(x+sign(xsp)),round(y),par_solid) && limit > 0){
		show_debug_message("while x 1")
		x += sign(xsp)*.01
		dis -= sign(xsp)*.01
		limit -= abs(xsp)*.01
	}
	xsp = 0
}else{
	x += xsp
}
if place_meeting((x),(y+ysp),par_solid){
	var col = instance_place((x),(y+ysp),par_solid)
	if col.xsp != 0 || col.ysp != 0{
		//col.xsp = 0
		//col.ysp = 0
		//xsp = 0
		//ysp = 0
	}
	var limit = abs(ysp)
	while(!place_meeting((x),(y+sign(ysp)),par_solid) && limit > 0){
		show_debug_message("while y")
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





