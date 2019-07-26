
move = obj_control.right_key - obj_control.left_key

if state = pick_up{
	x_offset = face*5 // Where to draw what's being held
	y_offset = -1
}else{
	x_offset = 0
	y_offset = -15
}

if place_meeting(x,y+1,par_solid){
	if state = hold{
		move_speed = hold_speed
		max_move_speed = max_hold_speed
	}else if state = die || state = pick_up || state = set_down{
		move = 0
		move_speed = 0
		max_move_speed = 0
	}else if state = hold{
		move_speed = hold_speed
		max_move_speed = max_hold_speed
	}else{
		move_speed = run_speed
		max_move_speed = max_run_speed
	}
}else{
	move_speed = air_move_factor*run_speed
	max_move_speed = max_run_speed
}

if move = sign(xsp){ // If trying to move in the same direction as momentum
	if abs(xsp) <= max_move_speed{ // If not already over limit
		if abs(xsp) + move_speed > max_move_speed{ // If going to go over limit
			// Set to limit
			xsp = move * max_move_speed
		}else{
			xsp += move * move_speed
		}
	}
}else{
	xsp += move * move_speed
}

if !place_meeting(x,y+1,par_solid) && state != ladder{ // Apply gravity
	ysp += grav_speed
}else{ // If on ground or ladder
	
	if state = ladder{
		if obj_control.down_key{
			ysp = 2
		}else if obj_control.up_key{
			ysp = -1
		}else{
			ysp = 0
		}
	}else{
		if (move != sign(xsp) || abs(xsp) > max_move_speed){ // Apply friction
			if abs(xsp) - move_friction > 0{
				xsp -= sign(xsp)*move_friction
			}else{
				xsp = 0
			}
		}
	}
	
	jumping = false
	if state != die{
		if obj_control.jump_key_pressed{ // Jump
			ysp += -jump_speed
			jumping = true
			state = jump
		}
		
		if move != 0{ // Set the facing of the player
			face = move
		}
	}
}

if ysp > 0{
	jumping = false
}
if keyboard_check_released(vk_space) && jumping{ // Variable jumping
	ysp *= variable_jump_factor
	jumping = false
}

script_execute(state) // Manage which state is active
image_xscale = face
scr_collision()
